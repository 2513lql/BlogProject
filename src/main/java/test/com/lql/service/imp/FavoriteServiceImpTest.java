package com.lql.service.imp;

import com.lql.domain.Blog;
import com.lql.domain.Favorite;
import com.lql.domain.Friend;
import com.lql.domain.User;
import com.lql.service.FavoriteService;
import com.lql.service.FriendService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * FavoriteServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class FavoriteServiceImpTest extends TestCase {
    public FavoriteServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetFavoritesCount() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        FavoriteService favoriteService = context.getBean("favoriteService",FavoriteService.class);
        int count = favoriteService.getFavoritesCount("2513LQL");
        System.out.println(count);


    }

    public void testGetFavoritesByUserId() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        FavoriteService favoriteService = context.getBean("favoriteService",FavoriteService.class);
        List<Favorite> favorites = favoriteService.getFavoritesByUserId("2513LQL");
        System.out.println(favorites.get(0).getBlog().getBlogId());

        Favorite favorite = new Favorite();
        favorite.setUserId("13245");
        Blog blog = new Blog(1);
        favorite.setBlog(blog);
//        favoriteService.deleteFavoriteByFavorite(favorite);
        if (favoriteService.queryFavoriteByFavorite(favorite) == 0){
            favoriteService.addNewFavorite(favorite);
        }
    }



    public static Test suite() {
        return new TestSuite(FavoriteServiceImpTest.class);
    }
}
