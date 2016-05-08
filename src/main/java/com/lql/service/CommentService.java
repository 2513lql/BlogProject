package com.lql.service;

import com.lql.domain.Comment;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface CommentService {

    public List<Comment> getCommentsByBlogId(Integer blogId);
    public void addNewComment(Comment comment);
    public void deleteCommentById(Comment comment);
}
