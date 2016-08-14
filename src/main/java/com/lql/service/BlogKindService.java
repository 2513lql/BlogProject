package com.lql.service;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogKindService {

    public List<BlogKind> getBlogKinds();
    public int addNewBlogKind(BlogKind blogKind);
    void updateBlogKindName(BlogKind blogKind);
    void addBlogCount(Integer kindId);
    BlogKind queryBlogKindByName(String kindName);
    void deleteBlogKind(Integer kindId);
}
