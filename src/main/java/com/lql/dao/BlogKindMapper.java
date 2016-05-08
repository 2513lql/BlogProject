package com.lql.dao;

import com.lql.domain.BlogKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface BlogKindMapper {

    public List<BlogKind> queryBlogKinds();
    public void addNewBlogKind(String kindName);
}
