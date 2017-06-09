package com.onlineVideo.login.dao;

import com.onlineVideo.login.pojo.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by niceyuanze on 17-6-4.
 */
public interface UserDao {





    public User getUserById(String uuid);

    public User getUserByLoginname(String loginname);

    public boolean saveUser(User user);



}
