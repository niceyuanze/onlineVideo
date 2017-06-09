package com.onlineVideo.video.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Entity
@Table(name = "advertisement")
public class Advertisement {

    @Id
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "path")
    private String path;




    public Advertisement() {
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
