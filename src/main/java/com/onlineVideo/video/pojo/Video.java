package com.onlineVideo.video.pojo;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Entity
@Table(name = "video")
public class Video {

    @Id
    private String id;

    @Column(name = "name")
    private String name;


    @Column(name="path")
    private String path;

    @Column(name="abstracts")
    private String abstracts;

    @Column(name="source")
    private String source;

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "video_advertisement",
            joinColumns = { @JoinColumn(name = "video$id") },
            inverseJoinColumns = { @JoinColumn(name = "advertisement$id") })
    private List<Advertisement> advertisements;



    public Video() {
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


    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }


    public List<Advertisement> getAdvertisements() {
        return advertisements;
    }

    public void setAdvertisements(List<Advertisement> advertisements) {
        this.advertisements = advertisements;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", source='" + source + '\'' +
                '}';
    }
}
