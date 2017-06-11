package com.onlineVideo.module.video.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.dao.VideoDao;
import com.onlineVideo.pojo.Advertisement;
import com.onlineVideo.pojo.Video;
import com.onlineVideo.web.base.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

/**
 * Created by niceyuanze on 17-6-7.
 */
@RestController
@RequestMapping("/video")
public class PlayVideo {

    @Autowired
    private VideoDao videoDao;

    @Autowired
    private HttpSession session;

    @ResponseBody
    @RequestMapping(value="/play/{id}", method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String getVideo( @PathVariable String id) throws JsonProcessingException {
        Subject subject = SecurityUtils.getSubject();
        String msg = "";
        if(!subject.isRemembered() && !subject.isAuthenticated()){
            msg = "nlogined";
            Random random = new Random();
            List<Advertisement> advertisementList = videoDao.getAdvertisements(id);
            session.setAttribute("lastVideoId",id);
            return Result.success(msg,advertisementList.get(random.nextInt(advertisementList.size())));
        }else{
            msg = "logined";
            Video video = videoDao.getVideo(id);
            return Result.success(msg,video);
        }

    }
    @ResponseBody
    @RequestMapping(value="/play", method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String getVideo() throws JsonProcessingException {
        if(session.getAttribute("lastVideoId") == null){
            return Result.error404("没有视频信息");
        }else{
            String id = (String)session.getAttribute("lastVideoId");
            session.removeAttribute("lastVideoId");
            return Result.success("ok",videoDao.getVideo(id));

        }
    }


    public VideoDao getVideoDao() {
        return videoDao;
    }

    public void setVideoDao(VideoDao videoDao) {
        this.videoDao = videoDao;
    }
}
