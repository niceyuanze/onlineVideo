package com.onlineVideo.dao;

import com.onlineVideo.pojo.Type;

import java.util.List;

/**
 * Created by niceyuanze on 17-6-10.
 */
public interface TypeDao {

    public List<Type> getTypes();

    public Type save(Type type);
    public Type get(String name);
}
