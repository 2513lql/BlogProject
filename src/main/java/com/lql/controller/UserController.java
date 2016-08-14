package com.lql.controller;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;
import com.lql.domain.User;
import com.lql.service.BlogKindService;
import com.lql.service.BlogService;
import com.lql.service.UserService;
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
import java.util.List;

/**
 * Created by LQL on 2016/5/13.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {


    @Autowired
    private UserService userService;
    @Autowired
    private BlogKindService blogKindService;
    @Autowired
    private BlogService blogService;

    @ResponseBody
    @RequestMapping(value = "/login",method = {RequestMethod.GET})
    public String handleLogin(String userName,String password,HttpSession session){
        String errorMsg;
        Boolean result = true;
        JSONObject jsonObj = new JSONObject();
        User user = userService.getUserInfoByUserNameOrEmail(userName.trim());
        if (user == null){
            errorMsg = "用户名有误";
            result = false;
            jsonObj.put("result",result);
            jsonObj.put("errorMsg",errorMsg);
            return jsonObj.toString();
        }else if(!user.getPassword().equals(password.trim())){
            errorMsg = "密码有误";
            result = false;
            jsonObj.put("result",result);
            jsonObj.put("errorMsg",errorMsg);
            return jsonObj.toString();
        }
        else {
            session.setAttribute("userName",user.getUserName());
            session.setAttribute("userInfo",user);
            jsonObj.put("result",result);
            jsonObj.put("userName",user.getUserName());
            return jsonObj.toString();
        }
    }

    @RequestMapping(value = "/usercenter",method = {RequestMethod.GET})
    public ModelAndView handleUserCenter(String userName){
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserInfoByUserNameOrEmail(userName);
        List<BlogKind> blogKinds = blogKindService.getBlogKinds();
        List<Blog> blogs = blogService.getBlogsDividePages(1,10);
        int recordsCount = blogService.getBlogsCount();
        modelAndView.addObject("userinfo",user);
        modelAndView.addObject("blogKinds",blogKinds);
        modelAndView.addObject("blogs",blogs);
        modelAndView.addObject("recordsCount",recordsCount);
        modelAndView.setViewName("user/usercenter");
        return modelAndView;
    }

}
