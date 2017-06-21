package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.AdvertisementDao;
import com.onlineVideo.pojo.Advertisement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by niceyuanze on 17-6-17.
 */
@Component
public class AdvertisementDaoImpl implements AdvertisementDao{

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void save(Advertisement advertisement) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(advertisement);
        transaction.commit();
        session.close();
    }
}
