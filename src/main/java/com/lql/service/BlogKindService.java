package com.lql.service;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogKindService {

    public List<BlogKind> getBlogKinds();
    public void addNewBlogKind(String kindName);
}
