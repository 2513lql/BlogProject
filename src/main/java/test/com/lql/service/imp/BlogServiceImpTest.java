package com.lql.service.imp;

import com.lql.domain.Blog;
import com.lql.domain.BlogKind;
import com.lql.domain.User;
import com.lql.service.BlogService;
import com.lql.util.DateUtil;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * BlogServiceImp Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>05/07/2016</pre>
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
        BlogService blogService = context.getBean("blogService", BlogService.class);
//        List<Blog> blogs = blogService.getBlogs();
//        System.out.println(blogs.get(0).getUser().getPassword());

//        Blog blog = blogService.queryBlogByBlogId(2);
//        blog.setBlogText("你好北京");
//        blogService.updateBlogInfo(blog);
//        blogService.deleteBlogByBlogId(3);
//            blogService.updateViewTimes(2);

//        for (int i = 0; i < 2; i++) {
//            Blog blog = new Blog();
//            blog.setBlogTitle("title1" + i);
//            blog.setBlogText("的战略方向。2015淘宝天猫双十一销售额最终数据显示，截至11日24时，全网总销售额1229.4亿，远超马云900亿目标。各种双11、双12促销以及电商平台风起云涌，甚至有学者扬言网上购物将会逐步取代传统购物。但在近几年内，我国大部分的商业机构，对于金融业务互联网化的反应迟滞，互联网金融产品已经对传统商业机构的市场份额形成一定冲击。因此本文选择“基于电商平台为核心的互联网金融”作为研究主题，对于传统商务的发展具有重要价值，所得到的研究成果将能够为传统商务发展电子商务业务、利用互联网渠道推广电子商务品牌、打造核心竞争力提供借鉴。本文具有深刻的理论和现实意义。一方面，目前学术界针对电子商务的研究非常丰富，但是与互联网+结合展开的研究并不多见。可见电子商务的互联网传播与推广、传统金融业务的网络化是一个崭新的课题，还有待学术界进行更加深入的讨论。另一方面，从对我国金融业加深互联网化、推进电子商务建设进程的方面看，本研究有丰富的现实价值，有助于我国各种金融机构及时转变发展思路、调整发展方向、寻找新的经营着力点，以保证长期的可持续发展能力。上世纪90年代以来，伴随着互联网技术和电子通信技术的快速发展，传统商务的电子化和互联网化进程也逐步推进；本世纪之初，传统商务中广泛应用信息技术在西方发达国家已经非常普遍，“电子商务”作为传统商务业务电子化的代名词，在金融业发展中的重要性也与日俱增。从用户的角度来看，电子商务能够简化交易流程，弱化商业网点对于业务办理和交易的限制，提升了商品交易的便捷性；从卖家的角度来看，电子商务能够降低运营成本，尤其在金融业无纸化的过程中发挥了重要作用，因此电子商务也逐渐成为金融业发展的战略方向。2015淘宝天猫双十一销售额最终数据显示，截至11日24时，全网总销售额1229.4亿，远超马云900亿目标。各种双11、双12促销以及电商平台风起云涌，甚至有学者扬言网上购物将会逐步取代传统购物。但在近几年内，我国大部分的商业机构，对于金融业务互联网化的反应迟滞，互联网金融产品已经对传统商业机构的市场份额形成一定冲击。因此本文选择“基于电商平台为核心的互联网金融”作为研究主题，对于传统商务的发展具有重要价值，所得到的研究成果将能够为传统商务发展电子商务业务、利用互联网渠道推广电子商务品牌、打造核心竞争力提供借鉴。本文具有深刻的理论和现实意义。一方面，目前学术界针对电子商务的研究非常丰富，但是与互联网+结合展开的研究并不多见。可见电子商务的互联网传播与推广、传统金融业务的网络化是一个崭新的课题，还有待学术界进行更加深入的讨论。另一方面，从对我国金融业加深互联网化、推进电子商务建设进程的方面看，本研究有丰富的现实价值，有助于我国各种金融机构及时转变发展思路、调整发展方向、寻找新的经营着力点，以保证长期的可持续发展能力。");
//            User user = new User("2513LQL");
//            blog.setPublishDate(DateUtil.generateCurrentDate());
//            blog.setUser(user);
//            BlogKind blogKind = new BlogKind();
//            blogKind.setKindId(4);
//            blog.setBlogKind(blogKind);
//            blogService.addNewBlog(blog);
//        }

        List<Blog> blogs = blogService.getBlogsDividePages(5, 10);
        List<Integer> idList = new ArrayList<Integer>();
        for (Blog blog : blogs){
            idList.add(blog.getBlogId());
        }
        blogService.batchDeleteBlog(idList);
//        blogService.batchInsertBlog(blogs);
//        for (Blog blog : blogs){
//            System.out.println(blog.getBlogId());
//            blog.setBlogKind(new BlogKind(2));
//        }

//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("blogKind",2);
//        map.put("blogList",blogs);
//        blogService.batchUpdateBlogKind(map);

//        List<Blog> blogs = blogService.getBlogsByKind(1);
//        System.out.println(blogs.get(0).getBlogText());
    }


    public static Test suite() {
        return new TestSuite(BlogServiceImpTest.class);
    }
}
