package com.onlineVideo.video.dao;

import com.onlineVideo.video.pojo.Advertisement;
import com.onlineVideo.video.pojo.Video;

import java.util.List;
import java.util.Map;

/**
 * Created by niceyuanze on 17-6-7.
 */
public interface VideoDao {


    public Video getVideo(String id);
    public Map<String, List<Video>> getAll();

    public List<Advertisement> getAdvertisements(String id);


}
