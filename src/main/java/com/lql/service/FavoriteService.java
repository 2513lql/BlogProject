package com.lql.service;

import com.lql.domain.Favorite;
import com.lql.domain.Friend;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface FavoriteService {

    public int getFavoritesCount(String userId);
    public List<Favorite> getFavoritesByUserId(String userId);
    public void addNewFavorite(Favorite favorite);
    public void deleteFavoriteByFavorite(Favorite favorite);

    public int queryFavoriteByFavorite(Favorite favorite);
}
