package com.lql.service.imp;

import com.github.pagehelper.PageHelper;
import com.lql.dao.BlogMapper;
import com.lql.domain.Blog;
import com.lql.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
@Transactional
@Service("blogService")
public class BlogServiceImp implements BlogService{

    @Autowired
    private BlogMapper blogMapper;

    public List<Blog> getBlogs() {
        List<Blog> blogs = blogMapper.queryBlogs();
        return blogs;
    }

    public List<Blog> getBlogsByKind(Integer blogKindId) {
        List<Blog> blogs = blogMapper.queryBlogsByKind(blogKindId);
        return blogs;
    }

    public List<Blog> getBlogsDividePageByKind(Integer currentPage, Integer pageSize,Integer blogKindId) {
        PageHelper.startPage(currentPage,pageSize);
        List<Blog> blogs = blogMapper.queryBlogsByKind(blogKindId);
        return blogs;
    }


    public List<Blog> getBlogsDividePages(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Blog> blogs = blogMapper.queryBlogs();
        return blogs;
    }

    public List<Blog> getBlogsByUserId(String userId) {
        List<Blog> blogs = blogMapper.queryBlogsByUserId(userId);
        return blogs;
    }

    public Blog getBlogByBlogId(Integer blogId) {
        return blogMapper.queryBlogByBlogId(blogId);
    }

    public void addNewBlog(Blog blog) {
        blogMapper.addNewBlog(blog);
    }

    public void deleteBlogByBlogId(Integer blogId) {
        blogMapper.deleteBlogByBlogId(blogId);
    }

    public void updateCommentTimes(Integer blogId) {
        blogMapper.updateCommentTimes(blogId);
    }

    public void updateViewTimes(Integer blogId) {
        blogMapper.updateViewTimes(blogId);
    }

    public void updateBlogInfo(Blog blog) {
        blogMapper.updateBlogInfo(blog);
    }

    public int getBlogsCount() {
        return blogMapper.queryBlogsCount();
    }

    public int getBlogsCountByKind(Integer blogKindId) {
        return blogMapper.queryBlogsCountByKind(blogKindId);
    }
}
