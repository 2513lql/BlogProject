package com.lql.domain;

import java.io.Serializable;

/**
 * Created by LQL on 2016/5/7.
 */
public class Picture implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer pictureId;
    private PictureKind pictureKind;
    private String pictureUrl;

    public PictureKind getPictureKind() {
        return pictureKind;
    }

    public void setPictureKind(PictureKind pictureKind) {
        this.pictureKind = pictureKind;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public Integer getPictureId() {
        return pictureId;
    }

    public void setPictureId(Integer pictureId) {
        this.pictureId = pictureId;
    }
}
