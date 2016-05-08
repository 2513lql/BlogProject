package com.lql.service;

import com.lql.domain.User;

/**
 * Created by LQL on 2016/5/7.
 */
public interface UserService {

    public User getUserInfoByUserNameOrEmail(String param);
    public void addNewUser(User user);
    public void updateUserInfo(User user);
    public void deleteUserByUserId(String userId);

}
