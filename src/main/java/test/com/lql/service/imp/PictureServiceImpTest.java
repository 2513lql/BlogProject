package com.lql.service.imp;

import com.lql.domain.Picture;
import com.lql.service.PictureService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * PictureServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class PictureServiceImpTest extends TestCase {
    public PictureServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetPicturesByPictureKind() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        PictureService pictureService = context.getBean("pictureService",PictureService.class);
        List<Picture> pictures = pictureService.getPicturesByPictureKind(1);
        System.out.println(pictures.get(0).getPictureUrl());
        pictureService.addPicturesBatch(pictures);

    }

    public static Test suite() {
        return new TestSuite(PictureServiceImpTest.class);
    }
}
