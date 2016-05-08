package com.lql.dao;

import com.lql.domain.Blog;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogMapper {

    public List<Blog> queryBlogs();
    public List<Blog> queryBlogsByUserId(String userId);
    public Blog queryBlogByBlogId(Integer blogId);
    public void addNewBlog(Blog blog);
    public void deleteBlogByBlogId(Integer blogId);
    public void updateCommentedState(Blog blog);
    public void updateViewTimes(Integer blogId);
    public void updateBlogInfo(Blog blog);
}
