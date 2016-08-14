package com.lql.controller;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;
import com.lql.domain.User;
import com.lql.service.BlogKindService;
import com.lql.service.BlogService;
import com.lql.service.UserService;
import com.lql.util.BlogContentUtil;
import com.lql.util.DateUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LQL on 2016/5/9.
 */
@Controller
@RequestMapping(value = "/blog")
public class BlogController {

    @Autowired
    private BlogKindService blogKindService;
    @Autowired
    private BlogService blogService;

    /**
     * 点击文章进入文章主页
     *
     * @param currentPage
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/getblogkind", method = {RequestMethod.GET})
    public ModelAndView getBlogKinds(String currentPage, String pageSize) {

        ModelAndView modelAndView = new ModelAndView();
        List<BlogKind> blogKinds = blogKindService.getBlogKinds();
        modelAndView.addObject("blogKinds", blogKinds);
        modelAndView.setViewName("blog/blogs2");
        List<Blog> blogs = blogService.getBlogsDividePages(Integer.parseInt(currentPage), Integer.parseInt(pageSize));
        blogs = BlogContentUtil.cutBlogContent(blogs);
        modelAndView.addObject("blogs", blogs);
        int recordsCount = blogService.getBlogsCount();
        modelAndView.addObject("recordsCount", recordsCount);
        return modelAndView;
    }

    /**
     * 点击博文的处理方法
     *
     * @param currentPage
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getallblogs", method = {RequestMethod.POST})
    public String getAllBlogs(Integer currentPage, Integer pageSize, Integer blogKindId) {
        List<Blog> blogs;
        int recordsCount;
        if (blogKindId == -1) {
            blogs = blogService.getBlogsDividePages(currentPage, pageSize);
            recordsCount = blogService.getBlogsCount();
        } else {
            blogs = blogService.getBlogsDividePageByKind(currentPage, pageSize, blogKindId);
            recordsCount = blogService.getBlogsCountByKind(blogKindId);
        }
        blogs = BlogContentUtil.cutBlogContent(blogs);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", blogs);
        jsonObj.put("recordsCount", recordsCount);
        return jsonObj.toString();
    }


    @ResponseBody
    @RequestMapping(value = "currentpageblogs", method = {RequestMethod.POST})
    public String getCurrentPageBlogs(Integer currentPage, Integer pageSize, Integer blogKindId) {
        List<Blog> blogs;
        if (blogKindId == -1) {
            blogs = blogService.getBlogsDividePages(currentPage, pageSize);
        } else {
            blogs = blogService.getBlogsDividePageByKind(currentPage, pageSize, blogKindId);
        }
        blogs = BlogContentUtil.cutBlogContent(blogs);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", blogs);
        return jsonObj.toString();
    }

    @RequestMapping(value = "/main", method = {RequestMethod.GET})
    public String goToMain() {

        return "main";
    }

    /**
     * 根据blogId 获取文章详情
     *
     * @param blogId
     * @return
     */
    @RequestMapping(value = "/blogdetail", method = {RequestMethod.GET})
    public ModelAndView showBlogDetail(String blogId) {
        ModelAndView modelAndView = new ModelAndView();
        Blog blog = blogService.getBlogByBlogId(Integer.parseInt(blogId));
        blogService.updateViewTimes(Integer.parseInt(blogId));
        modelAndView.addObject("blog", blog);
        modelAndView.setViewName("blog/blogDetail");
        return modelAndView;
    }

    /**
     * @param currentPage
     * @param pageSize
     * @param blogKindId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getblogsdividebykind", method = {RequestMethod.POST})
    public String getBlogsByBlogKind(Integer currentPage, Integer pageSize, Integer blogKindId) {

        List<Blog> blogs = blogService.getBlogsDividePageByKind(currentPage, pageSize, blogKindId);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", blogs);
        return jsonObj.toString();
    }

    /**
     * 点击删除文章
     *
     * @param blogId
     * @param currentPage
     * @param pageSize
     * @param blogKindId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteblog", method = {RequestMethod.POST})
    public String deleteBlogByBlogId(Integer blogId, Integer currentPage, Integer pageSize, Integer blogKindId) {
        blogService.deleteBlogByBlogId(blogId);
        List<Blog> blogs;
        if (blogKindId == -1) {
            blogs = blogService.getBlogsDividePages(currentPage, pageSize);
        } else {
            blogs = blogService.getBlogsDividePageByKind(currentPage, pageSize, blogKindId);
        }
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", blogs);
        return jsonObj.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/publishblog", method = {RequestMethod.POST})
    public String publishBlog(String blogContent, Integer blogKind, String blogTitle, HttpServletRequest request) {
        Blog blog = new Blog();
        blog.setBlogKind(new BlogKind(blogKind));
        blog.setBlogTitle(blogTitle);
        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userInfo");
        blog.setUser(userInfo);
        blog.setBlogText(blogContent);
        blog.setPublishDate(DateUtil.generateCurrentDate());
        blogService.addNewBlog(blog);
        blogKindService.addBlogCount(blogKind);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("result", "success");
        return jsonObj.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/editblogkind", method = {RequestMethod.POST})
    public String editBlogKind(Integer kindId, String kindName) {

        JSONObject jsonObj = new JSONObject();

        BlogKind blogKind = blogKindService.queryBlogKindByName(kindName);
        if (blogKind != null) {
            jsonObj.put("msg", "fail");
        } else {
            blogKind = new BlogKind(kindId, kindName);
            blogKindService.updateBlogKindName(blogKind);
            List<BlogKind> blogKinds = blogKindService.getBlogKinds();
            jsonObj.put("msg", "success");
            jsonObj.put("blogKinds", blogKinds);
        }
        return jsonObj.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/addblogkind", method = {RequestMethod.POST})
    public String addBlogKind(String kindName) {
        BlogKind blogKind = blogKindService.queryBlogKindByName(kindName);
        JSONObject jsonObj = new JSONObject();
        if (blogKind != null) {
            jsonObj.put("msg", "fail");
        } else {
            blogKind.setKindName(kindName);
            blogKindService.addNewBlogKind(blogKind);
            blogKind = blogKindService.queryBlogKindByName(kindName);
            List<BlogKind> blogKinds = new ArrayList<BlogKind>();
            blogKinds.add(blogKind);
            jsonObj.put("msg", "success");
            jsonObj.put("blogKinds", blogKinds);
        }
        return jsonObj.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/deleteblogkind", method = {RequestMethod.POST})
    public String deleteBlogKind(Integer kindId) {

        BlogKind blogKind = blogKindService.queryBlogKindByName("其他");
        if (blogKind == null) {
            blogKind.setKindName("其他");
            blogKindService.addNewBlogKind(blogKind);
        }
        List<Blog> blogs = blogService.getBlogsByKind(kindId);
        Map<String ,Object> map = new HashMap<String, Object>();
        map.put("kindId",blogKind.getKindId());
        map.put("blogs",blogs);
        blogService.batchUpdateBlogKind(map);
        blogKindService.deleteBlogKind(kindId);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("msg","success");
        return jsonObj.toString();
    }

    @RequestMapping(value = "/crossorigin",method = {RequestMethod.GET})
    @ResponseBody
    public void testCrossOrigin(HttpServletRequest request , HttpServletResponse response){
        response.setContentType("text/plain");
        String callback = request.getParameter("callback");

        JSONObject jsonObj = new JSONObject();
        jsonObj.put("res","success");
        jsonObj.put("name","jack");
        try {
            response.getWriter().write(callback + "("+ jsonObj +")");
        } catch (IOException e) {
            e.printStackTrace();
        }
//        JSONObject jsonObj = new JSONObject();
//        jsonObj.put("res","success");
//        return jsonObj.toString();
    }
}
