package com.lql.service;

import com.lql.domain.Blog;

import java.util.List;
import java.util.Map;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogService {

    public List<Blog> getBlogs();
    public List<Blog> getBlogsByKind(Integer blogKindId);
    public List<Blog> getBlogsDividePageByKind(Integer currentPage, Integer pageSize,Integer blogKindId);
    public List<Blog> getBlogsDividePages(int currentPage,int pageSize);
    public List<Blog> getBlogsByUserId(String userId);
    public Blog getBlogByBlogId(Integer blogId);
    public void addNewBlog(Blog blog);
    public void deleteBlogByBlogId(Integer blogId);
    public void updateCommentTimes(Integer blogId);
    public void updateViewTimes(Integer blogId);
    public void updateBlogInfo(Blog blog);
    public int getBlogsCount();
    public int getBlogsCountByKind(Integer blogKindId);
    void batchUpdateBlogKind(Map<String,Object> map);
    void batchInsertBlog(List<Blog> blogs);
    void batchDeleteBlog(List<Integer> idList);
}
