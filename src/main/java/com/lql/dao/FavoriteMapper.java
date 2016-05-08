package com.lql.dao;

import com.lql.domain.Favorite;
import com.lql.domain.Friend;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface FavoriteMapper {

    public int queryFavoritesCount(String userId);
    public List<Favorite> queryFavoritesByUserId(String userId);
    public void addNewFavorite(Favorite favorite);
    public void deleteFavoriteByFavorite(Favorite favorite);//删除收藏
    public int queryFavoriteByFavorite(Favorite favorite);//判断是否已经收藏了该文章

}
