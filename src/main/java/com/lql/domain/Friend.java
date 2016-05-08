package com.lql.domain;

import java.io.Serializable;

/**
 * Created by LQL on 2016/5/7.
 */
public class Friend implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String userId;
    private User friend;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getFriend() {
        return friend;
    }

    public void setFriend(User friend) {
        this.friend = friend;
    }
}
