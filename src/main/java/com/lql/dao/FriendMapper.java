package com.lql.dao;

import com.lql.domain.Friend;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface FriendMapper {

    public List<Friend> queryFriendsByUserId(String userId);
    public int queryFriendsCount(String userId);
    public void addNewFriend(Friend friend);
    public void deleteFriendByFriend(Friend friend);//删除好友
    public int queryFriendByFriend(Friend friend);//判断两人是否已经是好友

}
