package com.lql.service.imp;

import com.lql.dao.FavoriteMapper;
import com.lql.domain.Favorite;
import com.lql.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */

@Service("favoriteService")
@Transactional
public class FavoriteServiceImp implements FavoriteService{

    @Autowired
    private FavoriteMapper favoriteMapper;

    public int getFavoritesCount(String userId) {
        return favoriteMapper.queryFavoritesCount(userId);
    }

    public List<Favorite> getFavoritesByUserId(String userId) {
        List<Favorite> favorites = favoriteMapper.queryFavoritesByUserId(userId);
        return favorites;
    }

    public void addNewFavorite(Favorite favorite) {
        favoriteMapper.addNewFavorite(favorite);
    }

    public void deleteFavoriteByFavorite(Favorite favorite) {
        favoriteMapper.deleteFavoriteByFavorite(favorite);
    }

    public int queryFavoriteByFavorite(Favorite favorite) {
        return favoriteMapper.queryFavoriteByFavorite(favorite);
    }
}
