package com.lql.service.imp;

import com.lql.dao.CommentMapper;
import com.lql.domain.Comment;
import com.lql.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */

@Service("commentService")
@Transactional
public class CommentServiceImp implements CommentService{

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> getCommentsByBlogId(Integer blogId) {
        List<Comment> comments = commentMapper.queryCommentsByBlogId(blogId);
        return comments;
    }

    public void addNewComment(Comment comment) {
        commentMapper.addNewComment(comment);
    }

    public void deleteCommentById(Comment comment) {
        commentMapper.deleteCommentById(comment);
    }
}
