package com.lql.domain;

import java.io.Serializable;

/**
 * Created by LQL on 2016/5/7.
 */
public class BlogKind implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer kindId;
    private String kindName;
    private Integer blogsCount;

    public Integer getKindId() {
        return kindId;
    }

    public void setKindId(Integer kindId) {
        this.kindId = kindId;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }

    public Integer getBlogsCount() {
        return blogsCount;
    }

    public void setBlogsCount(Integer blogsCount) {
        this.blogsCount = blogsCount;
    }

    public BlogKind(){

    }
    public BlogKind(Integer kindId){
        this.kindId = kindId;
    }
    public BlogKind(Integer kindId,String kindName){
        this(kindId);
        this.kindName = kindName;
    }
    public BlogKind(Integer kindId,String kindName,Integer blogsCount){
        this(kindId,kindName);
        this.blogsCount = blogsCount;
    }
    public BlogKind(String kindName){
        this.kindName = kindName;
    }
}
