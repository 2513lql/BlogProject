package com.lql.dao;

import com.lql.domain.Blog;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogMapper {

    public List<Blog> queryBlogs();
    public List<Blog> queryBlogsByKind(Integer blogKindId);
    public List<Blog> queryBlogsByUserId(String userId);
    public Blog queryBlogByBlogId(Integer blogId);
    public int queryBlogsCount();
    public int queryBlogsCountByKind(Integer blogKindId);
    public void addNewBlog(Blog blog);
    public void deleteBlogByBlogId(Integer blogId);
    public void updateCommentTimes(Integer blogId);
    public void updateViewTimes(Integer blogId);
    public void updateBlogInfo(Blog blog);


}
