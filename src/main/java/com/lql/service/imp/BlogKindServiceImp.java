package com.lql.service.imp;

import com.lql.dao.BlogKindMapper;
import com.lql.domain.Blog;
import com.lql.domain.BlogKind;
import com.lql.service.BlogKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.ls.LSInput;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */

@Service("blogKindService")
@Transactional
public class BlogKindServiceImp implements BlogKindService {


    @Autowired
    private BlogKindMapper blogKindMapper;

    public List<BlogKind> getBlogKinds() {

        List<BlogKind> blogKinds = blogKindMapper.queryBlogKinds();
        return blogKinds;
    }

    public void addNewBlogKind(String kindName) {
        blogKindMapper.addNewBlogKind(kindName);
    }
}
