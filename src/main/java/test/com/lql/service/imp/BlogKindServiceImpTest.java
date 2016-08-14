package com.lql.service.imp;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;
import com.lql.service.BlogKindService;
import com.lql.service.BlogService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * BlogKindServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class BlogKindServiceImpTest extends TestCase {
    public BlogKindServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void test(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        BlogKindService blogKindService = context.getBean("blogKindService",BlogKindService.class);
//        List<BlogKind> blogKinds = blogKindService.getBlogKinds();
//        System.out.println(blogKinds.get(0).getKindName());
        BlogKind blogKind = new BlogKind();
        blogKind.setKindName("aaa");
        blogKindService.addNewBlogKind(blogKind);
        System.out.println(blogKind.getKindId());


    }

    public static Test suite() {
        return new TestSuite(BlogKindServiceImpTest.class);
    }
}
