package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.TypeDao;
import com.onlineVideo.pojo.Type;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-10.
 */
@Component
public class TypeDaoImpl implements TypeDao{

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<Type> getTypes() {
        Session session = sessionFactory.openSession();
        String hql = "from Type";
        List<Type> types =  session.createQuery(hql).list();
        session.close();
        return types;
    }

    @Override
    public Type save(Type type) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(type);
        transaction.commit();
        session.close();
        return type;
    }

    @Override
    public Type get(String name) {
        Session session = sessionFactory.openSession();
        Type type = session.get(Type.class,name);
        session.close();
        return type;
    }


}
