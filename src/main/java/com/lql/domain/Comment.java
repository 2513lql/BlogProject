package com.lql.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LQL on 2016/5/7.
 */
public class Comment implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer commentId;
    private Integer blogId;
    private String content;
    private String commentDate;
    private User user;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
