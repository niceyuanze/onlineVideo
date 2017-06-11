package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.UserDao;
import com.onlineVideo.pojo.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-4.
 */
@Component
public class UserDaoImpl implements UserDao{

    @Autowired
    private SessionFactory sessionFactory ;


    //根据用户id获取到用户的信息
    @Override
    public User getUserById(String uuid) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        session.beginTransaction();
        User user = session.get(User.class,uuid);
        session.get(User.class,"e140c7a322494a23bc1b85739b01113d");




        transaction.commit();
        session.close();




        return user;



    }

    //根据用户登录名获取用户信息
    @Override
    public User getUserByLoginname(String loginname) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        String hql = "from User user where user.loginname =:loginname";
        List<User> users = session.createQuery(hql)
                .setParameter("loginname",loginname)
                .list();
        System.out.println(users);
        transaction.commit();
        session.close();
        return users.size() == 0?null:users.get(0 );
    }



    @Override
    public boolean saveUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();



        session.save(user);


        transaction.commit();
        session.close();
        return true;


    }


}
