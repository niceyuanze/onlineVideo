package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.StaffDao;
import com.onlineVideo.pojo.Staff;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-17.
 */

@Component
public class StaffDaoImpl implements StaffDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void save(Staff staff) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(staff);
        transaction.commit();
        session.close();
    }

    @Override
    public Staff getStaffByLoginname(String username) {
        Session session = sessionFactory.openSession();
        String hql = "from Staff s where s.staffCode=:username";
        List<Staff> list =
                session.createQuery(hql).setParameter("username",username).list();
        System.out.println(list);
        session.close();
        return list.size() == 0 ? null:list.get(0);
    }
}
