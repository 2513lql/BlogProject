package com.lql.service.imp;

import com.lql.domain.Comment;
import com.lql.domain.User;
import com.lql.service.CommentService;
import com.lql.util.DateUtil;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * CommentServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class CommentServiceImpTest extends TestCase {
    public CommentServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetCommentsByBlogId() throws Exception {
        //TODO: Test goes here...

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        CommentService commentService = context.getBean("commentService",CommentService.class);
        List<Comment> comments = commentService.getCommentsByBlogId(1);
        System.out.println(comments.get(0).getContent());

        Comment comment = new Comment();
        comment.setBlogId(2);
        comment.setCommentDate(DateUtil.generateCurrentDate());
        comment.setContent("不错");
        comment.setUser(new User("13245"));
//        commentService.addNewComment(comment);

        comment.setCommentId(2);
        commentService.deleteCommentById(comment);

    }

    public static Test suite() {
        return new TestSuite(CommentServiceImpTest.class);
    }
}
