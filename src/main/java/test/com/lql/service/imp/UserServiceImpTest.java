package com.lql.service.imp;

import com.lql.domain.User;
import com.lql.service.UserService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * UserServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class UserServiceImpTest extends TestCase {
    public UserServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }
    public void testGetUserInfoByUserIdOrEmail() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        UserService userService = context.getBean("userService", UserService.class);
        User user = userService.getUserInfoByUserNameOrEmail("2513lql");
        System.out.println(user.getAddress());

        user.setAddress("北京");
        userService.updateUserInfo(user);
    }

    public static Test suite() {
        return new TestSuite(UserServiceImpTest.class);
    }
}
