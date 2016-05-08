package com.lql.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LQL on 2016/5/7.
 */
public class State implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer id;
    private User user;
    private String content;
    private String pictures;
    private String publishDate;
    private String security;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getSecurity() {
        return security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }
}
