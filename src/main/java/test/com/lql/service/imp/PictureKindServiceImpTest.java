package com.lql.service.imp;

import com.lql.domain.PictureKind;
import com.lql.service.PictureKindService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * PictureKindServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class PictureKindServiceImpTest extends TestCase {
    public PictureKindServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetPictureKindsByUserId() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        PictureKindService pictureKindService = context.getBean("pictureKindService",PictureKindService.class);
        List<PictureKind> pictureKinds = pictureKindService.getPictureKindsByUserId("2513LQL");
        System.out.println(pictureKinds.get(0).getKindName());

        pictureKindService.addPictureKind(pictureKinds.get(0));
    }

    public static Test suite() {
        return new TestSuite(PictureKindServiceImpTest.class);
    }
}
