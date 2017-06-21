package com.onlineVideo.dao.impl;

import com.onlineVideo.dao.RoleDao;
import com.onlineVideo.pojo.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-17.
 */
@Component
public class RoleDaoImpl implements RoleDao{


    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<Role> getAll() {
        Session session = sessionFactory.openSession();
        String hql = "from Role";
        List<Role> roles = session.createQuery(hql).list();
        session.close();
        return roles;
    }
}
