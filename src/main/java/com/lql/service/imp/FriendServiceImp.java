package com.lql.service.imp;

import com.lql.dao.FriendMapper;
import com.lql.domain.Friend;
import com.lql.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
@Service("friendService")
@Transactional
public class FriendServiceImp implements FriendService{


    @Autowired
    private FriendMapper friendMapper;

    public List<Friend> getFriendsByUserId(String userId) {

        List<Friend> friends = friendMapper.queryFriendsByUserId(userId);
        return friends;
    }

    public int getFriendsCount(String userId) {

        return friendMapper.queryFriendsCount(userId);

    }

    public void addNewFriend(Friend friend) {
        friendMapper.addNewFriend(friend);
    }

    public void deleteFriendByFriend(Friend friend) {
        friendMapper.deleteFriendByFriend(friend);
    }

    public int queryFriendByFriend(Friend friend) {

        return friendMapper.queryFriendByFriend(friend);
    }
}
