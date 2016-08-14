package com.lql.dao;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogKindMapper {

    public List<BlogKind> queryBlogKinds();
    public int addNewBlogKind(BlogKind blogKind);
    void updateBlogKindName(BlogKind blogKind);
    void addBlogCount(Integer kindId);
    BlogKind queryBlogKindByKindName(String kindName);
    void deleteBlogKind(Integer kindId);
}
