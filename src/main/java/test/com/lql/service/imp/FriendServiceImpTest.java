package com.lql.service.imp;

import com.lql.domain.Friend;
import com.lql.domain.User;
import com.lql.service.FriendService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * FriendServiceImp Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>05/07/2016</pre>
 */
public class FriendServiceImpTest extends TestCase {
    public FriendServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetFriendsByUserId() throws Exception {
        //TODO: Test goes here...

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        FriendService friendService = context.getBean("friendService", FriendService.class);
        List<Friend> friends = friendService.getFriendsByUserId("2513LQL");
        System.out.println(friends.get(0).getFriend().getUserId());
        Friend friend = new Friend();
        friend.setUserId("13245");
        User user = new User("2513LQL");
        friend.setFriend(user);
        if (friendService.queryFriendByFriend(friend) == 0) {
               friendService.addNewFriend(friend);
        }
    }

    public void testGetFriendsCount() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        FriendService friendService = context.getBean("friendService", FriendService.class);
        int count = friendService.getFriendsCount("2513LQL");
        System.out.println(count);


    }

    public static Test suite() {
        return new TestSuite(FriendServiceImpTest.class);
    }
}
