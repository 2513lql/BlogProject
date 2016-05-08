package com.lql.domain;

import java.io.Serializable;
import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public class PictureKind implements Serializable{

    private static final long serialVersionUID = 1L;
    private Integer pictureKindId;
    private String userId;
    private String kindName;

    public Integer getPictureKindId() {
        return pictureKindId;
    }

    public void setPictureKindId(Integer pictureKindId) {
        this.pictureKindId = pictureKindId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }
}
