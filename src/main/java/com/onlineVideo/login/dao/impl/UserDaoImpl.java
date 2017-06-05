package com.onlineVideo.login.dao.impl;

import com.onlineVideo.login.dao.UserDao;
import com.onlineVideo.login.pojo.User;
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

    public User getUserByLoginname(String loginname) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        String hql = "from User user where user.id =:loginname";
        List<User> users = session.createQuery(hql)
                .setParameter("loginname",loginname)
                .list();


        return users.size() == 0?null:users.get(1);
    }



}
