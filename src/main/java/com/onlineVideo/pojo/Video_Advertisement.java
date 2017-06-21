package com.onlineVideo.pojo;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by niceyuanze on 17-6-17.
 */
@Entity
@Table(name="video_advertisement")
public class Video_Advertisement implements Serializable {

    @Column(name = "id")
    @GeneratedValue(generator = "uuid") @GenericGenerator(name = "uuid", strategy = "uuid")
    private String id;

    @Id
    @ManyToOne
    @JoinColumn(name = "video$id",referencedColumnName = "id")

    private Video video;

    @Id
    @ManyToOne
    @JoinColumn(name = "advertisement$id",referencedColumnName = "id")
    private Advertisement advertisement;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public Advertisement getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(Advertisement advertisement) {
        this.advertisement = advertisement;
    }
}
