package com.onlineVideo.video.pojo;

import com.onlineVideo.login.pojo.User;
import org.hibernate.Session;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-3.
 */
public class Main {
    public static void main(String[] args) {
//        A SessionFactory is set up once for an application!
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        org.hibernate.SessionFactory sessionFactory = null;
        sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();






        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String hql = "from User user where user.loginname=:loginname";
        List list = session.createQuery(hql).setParameter("loginname","admin1").list();
//        System.out.println(list. + "   " +(list == null));

//        System.out.println(session.get(User.class,"e140c7a322494a23bc1b85739b01113d"));
//        session.get(User.class,"e140c7a322494a23bc1b85739b01113d");
//        session.getTransaction().commit();
//        session.close();
        //e140c7a322494a23bc1b85739b01113d
    }
}
