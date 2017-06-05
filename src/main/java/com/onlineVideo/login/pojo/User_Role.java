package com.onlineVideo.login.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by niceyuanze on 17-6-5.
 */
@Entity
@Table(name="user_role")
public class User_Role {
    private String id;

    @Id
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
