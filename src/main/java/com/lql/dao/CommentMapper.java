package com.lql.dao;

import com.lql.domain.Comment;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface CommentMapper {
    public List<Comment> queryCommentsByBlogId(Integer blogId);
    public void addNewComment(Comment comment);
    public void deleteCommentById(Comment comment);
}
