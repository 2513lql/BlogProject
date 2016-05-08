package com.lql.service.imp;

import com.lql.dao.PictureKindMapper;
import com.lql.domain.Picture;
import com.lql.domain.PictureKind;
import com.lql.service.PictureKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
@Service("pictureKindService")
@Transactional
public class PictureKindServiceImp implements PictureKindService{

    @Autowired
    private PictureKindMapper pictureKindMapper;
    public List<PictureKind> getPictureKindsByUserId(String userId) {

        List<PictureKind> pictureKinds = pictureKindMapper.queryPictureKindsByUserId(userId);
        return pictureKinds;
    }

    public void addPictureKind(PictureKind pictureKind) {
        pictureKindMapper.addNewPictureKind(pictureKind);
    }
}
