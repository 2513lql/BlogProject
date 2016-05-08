package com.lql.dao;

import com.lql.domain.Picture;
import com.lql.domain.PictureKind;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface PictureKindMapper {

    public List<PictureKind> queryPictureKindsByUserId(String userId);
    public void addNewPictureKind(PictureKind pictureKind);
}
