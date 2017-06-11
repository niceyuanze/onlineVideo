package com.onlineVideo.pojo;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by niceyuanze on 17-6-10.
 */
@Entity
@Table(name = "type")
public class Type {

    @Column(name="id")
    private String id;



    @Id
    private String name;





    public Type() {
    }

    @Override
    public String toString() {
        return "Type{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
