package com.lql.domain;

import java.io.Serializable;
import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public class Favorite implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String userId;
    private Blog blog;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
}
