package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.VideoDao;
import com.onlineVideo.pojo.Advertisement;
import com.onlineVideo.pojo.Type;
import com.onlineVideo.pojo.Video;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Component
public class VideoDaoImpl implements VideoDao{

    @Autowired
    private SessionFactory sessionFactory ;

    @Autowired
    private TypeDaoImpl typeDao;







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
        String hql =" from Video";
        List<Video> videos = session.createQuery(hql).list();

        transaction.commit();
        session.close();
        return videos.stream().sorted(Comparator.comparing(x -> x.getName())).collect(Collectors.groupingBy(x -> x.getType().getName()));
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

    @Override
    public List<Video> search(Video video) {
        Disjunction disjunction = Restrictions.disjunction();
        Conjunction conjunction = Restrictions.conjunction();
        if(video.getName() != null && video.getName().length() != 0 ){
            disjunction.add(Restrictions.like("name",video.getName(), MatchMode.ANYWHERE));
        }
        if(video.getAbstracts() != null && video.getAbstracts().length() != 0){
            disjunction.add(Restrictions.like("abstracts",video.getAbstracts(), MatchMode.ANYWHERE));
        }
        if(video.getSource() != null && video.getSource().length() != 0){
            disjunction.add(Restrictions.like("source",video.getSource(), MatchMode.ANYWHERE));
        }
        if(video.getType() != null){
            conjunction.add(Restrictions.eq("type",video.getType()));
        }
        DetachedCriteria dc = DetachedCriteria.forClass(Video.class);
        dc.add(disjunction);
        dc.add(conjunction);
        Session session = sessionFactory.openSession();
        Criteria c = dc.getExecutableCriteria(session);
        List<Video> videoList = c.list();
        session.close();
        return videoList.size()==0?null:videoList;
    }


}
