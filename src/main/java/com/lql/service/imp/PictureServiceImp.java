package com.lql.service.imp;

import com.lql.dao.PictureMapper;
import com.lql.domain.Picture;
import com.lql.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
@Service("pictureService")
@Transactional
public class PictureServiceImp implements PictureService{


    @Autowired
    private PictureMapper pictureMapper;


    public List<Picture> getPicturesByPictureKind(Integer pictureKindId) {
        List<Picture> pictures = pictureMapper.queryPicturesByPictureKind(pictureKindId);
        return pictures;
    }

    public void addPicturesBatch(List<Picture> pictures) {
        pictureMapper.insertBatch(pictures);
    }
}
