package com.onlineVideo.login.pojo;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by niceyuanze on 17-6-4.
 */
//role表
@Entity
@Table(name="role")
public class Role {
    @Id
    @GeneratedValue(generator = "uuid") @GenericGenerator(name = "uuid", strategy = "uuid")
    private String id;

    @Column(name = "content", nullable = false,updatable = false,unique = true)
    private String content;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
