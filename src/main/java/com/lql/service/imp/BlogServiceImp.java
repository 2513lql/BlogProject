package com.lql.service.imp;

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

    public List<Blog> queryBlogsByUserId(String userId) {
        List<Blog> blogs = blogMapper.queryBlogsByUserId(userId);
        return blogs;
    }

    public Blog queryBlogByBlogId(Integer blogId) {
        return blogMapper.queryBlogByBlogId(blogId);
    }

    public void addNewBlog(Blog blog) {
        blogMapper.addNewBlog(blog);
    }

    public void deleteBlogByBlogId(Integer blogId) {
        blogMapper.deleteBlogByBlogId(blogId);
    }

    public void updateCommentedState(Blog blog) {
        blogMapper.updateCommentedState(blog);
    }

    public void updateViewTimes(Integer blogId) {
        blogMapper.updateViewTimes(blogId);
    }

    public void updateBlogInfo(Blog blog) {
        blogMapper.updateBlogInfo(blog);
    }

}
