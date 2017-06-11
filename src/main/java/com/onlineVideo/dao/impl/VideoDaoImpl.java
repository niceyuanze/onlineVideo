package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.VideoDao;
import com.onlineVideo.pojo.Advertisement;
import com.onlineVideo.pojo.Video;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Component
public class VideoDaoImpl implements VideoDao{

    @Autowired
    private SessionFactory sessionFactory ;







    @Override
    public Video getVideo(String id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Video video = session.get(Video.class,id);
        transaction.commit();
        session.close();
        return video;
    }

    @Override
    public Map<String, List<Video>> getAll() {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        String hql =" from video";
        transaction.commit();
        session.close();
        return null;
    }

    @Override
    public List<Advertisement> getAdvertisements(String id) {
        Video video = getVideo(id);
        return video.getAdvertisements();
    }

    @Override
    public boolean save(Video video) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(video);
        transaction.commit();
        session.close();
        return true;
    }


}
