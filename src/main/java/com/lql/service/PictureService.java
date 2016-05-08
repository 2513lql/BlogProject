package com.lql.service;

import com.lql.domain.Picture;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface PictureService {

    public List<Picture> getPicturesByPictureKind(Integer pictureKindId);
    public void addPicturesBatch(List<Picture> pictures);

}
