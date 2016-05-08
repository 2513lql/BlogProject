package com.lql.service;

import com.lql.domain.PictureKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface PictureKindService {

    public List<PictureKind> getPictureKindsByUserId(String userId);
    public void addPictureKind(PictureKind pictureKind);

}
