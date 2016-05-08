package com.lql.domain;

import java.io.Serializable;

/**
 * Created by LQL on 2016/5/7.
 */
public class BlogKind implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer kindId;
    private String kindName;

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
}
