package com.lql.service.imp;

import com.lql.dao.UserMapper;
import com.lql.domain.User;
import com.lql.service.UserService;
import com.lql.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LQL on 2016/5/7.
 */
@Service("userService")
@Transactional
public class UserServiceImp implements UserService{

    @Autowired
    private UserMapper userMapper;

    public User getUserInfoByUserNameOrEmail(String param) {
        User user = userMapper.queryUserInfoByUserNameOrEmail(param);
        return user;
    }

    public void addNewUser(User user) {
        user.setUserId(UUIDUtil.generateUserId());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        user.setRegisteDate(date);
        user.setRole(0);
        userMapper.saveUserInfo(user);
    }

    public void updateUserInfo(User user) {
        userMapper.updateUserInfo(user);
    }

    public void deleteUserByUserId(String userId) {
        userMapper.deleteUserByUserId(userId);
    }

}
