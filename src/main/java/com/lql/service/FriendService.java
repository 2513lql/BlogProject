package com.lql.service;

import com.lql.domain.Friend;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface FriendService {

    public List<Friend> getFriendsByUserId(String userId);
    public int getFriendsCount(String userId);
    public void addNewFriend(Friend friend);
    public void deleteFriendByFriend(Friend friend);

    /**
     * 根据好友关系判断两人是否已经是好友
     * @param friend
     * @return：0表示不是好友，大于0表示两人已经是好友
     */
    public int queryFriendByFriend(Friend friend);
}
