package com.onlineVideo.dao;

import com.onlineVideo.pojo.User;

/**
 * Created by niceyuanze on 17-6-4.
 */
public interface UserDao {





    public User getUserById(String uuid);

    public User getUserByLoginname(String loginname);

    public boolean saveUser(User user);



}
