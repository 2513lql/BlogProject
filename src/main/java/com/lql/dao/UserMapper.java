package com.lql.dao;

import com.lql.domain.User;

/**
 * Created by LQL on 2016/5/7.
 */
public interface UserMapper {

    public User queryUserInfoByUserNameOrEmail(String param);
    public void saveUserInfo(User user);
    public void updateUserInfo(User user);
    public void deleteUserByUserId(String userId);


}
