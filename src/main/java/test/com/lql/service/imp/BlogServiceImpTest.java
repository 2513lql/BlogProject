package com.lql.service.imp;

import com.lql.domain.Blog;
import com.lql.service.BlogService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * BlogServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class BlogServiceImpTest extends TestCase {
    public BlogServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetBlogs() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        BlogService blogService = context.getBean("blogService",BlogService.class);
        List<Blog> blogs = blogService.getBlogs();
        System.out.println(blogs.get(0).getUser().getPassword());

//        Blog blog = blogService.queryBlogByBlogId(2);
//        blog.setBlogText("你好北京");
//        blogService.updateBlogInfo(blog);
//        blogService.deleteBlogByBlogId(3);
            blogService.updateViewTimes(2);
    }


    public static Test suite() {
        return new TestSuite(BlogServiceImpTest.class);
    }
}
