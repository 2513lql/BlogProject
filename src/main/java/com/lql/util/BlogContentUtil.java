package com.lql.util;

import com.lql.domain.Blog;

import java.util.List;

/**
 * Created by LQL on 2016/5/10.
 */
public class BlogContentUtil {

    public static List<Blog> cutBlogContent(List<Blog> blogs) {
        for (Blog blog : blogs){
            if (blog.getBlogText().length() > 170) {
                String content = blog.getBlogText().substring(0, 170) + "...";
                blog.setBlogText(content);
            }
        }
        return blogs;
    }

}
