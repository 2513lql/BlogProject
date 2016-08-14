package com.lql.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LQL on 2016/5/7.
 */
public class Blog implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer blogId;
    private String blogTitle;
    private String blogText;
    private BlogKind blogKind;
    private String publishDate;
    private User user;
    private String pictures;
    private String css;
    private Integer viewTimes;
    private int commentTimes;
    public Blog(){

    }

    public Blog(Integer blogId) {
        this.blogId = blogId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogText() {
        return blogText;
    }

    public void setBlogText(String blogText) {
        this.blogText = blogText;
    }

    public BlogKind getBlogKind() {
        return blogKind;
    }

    public void setBlogKind(BlogKind blogKind) {
        this.blogKind = blogKind;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCss() {
        return css;
    }

    public void setCss(String css) {
        this.css = css;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    public Integer getViewTimes() {
        return viewTimes;
    }

    public void setViewTimes(Integer viewTimes) {
        this.viewTimes = viewTimes;
    }

    public int getCommentTimes() {
        return commentTimes;
    }

    public void setCommentTimes(int commentTimes) {
        this.commentTimes = commentTimes;
    }
}
