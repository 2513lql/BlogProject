package com.lql.dao;

import com.lql.domain.Picture;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface PictureMapper {

    public List<Picture> queryPicturesByPictureKind(Integer pictureKindId);
    public void insertBatch(List<Picture> list);


}
