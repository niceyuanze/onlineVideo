package com.onlineVideo.module.cms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.dao.TypeDao;
import com.onlineVideo.dao.VideoDao;
import com.onlineVideo.pojo.Type;
import com.onlineVideo.pojo.Video;
import com.onlineVideo.web.base.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

/**
 * Created by niceyuanze on 17-6-10.
 */
@RestController
@RequestMapping("/cms/videoManage")
public class VideoManagement {



    @Autowired
    private TypeDao typeDao;

    @Autowired
    private VideoDao videoDao;

    @ResponseBody
    @RequestMapping(value="/addVideo", method={RequestMethod.POST,RequestMethod.GET},produces = "text/json;charset=UTF-8")
    public String save(Video video,
                       MultipartFile newVideo,
                       MultipartFile newImage,
                       String type1,
                       HttpServletRequest request) throws IOException {
        //获取视频的拓展名
        String videoFormat =
                newVideo.getOriginalFilename()
                        .substring(newVideo.getOriginalFilename().lastIndexOf("."));
        //获取图片的拓展名
        String imageFormat =
                newImage.getOriginalFilename()
                        .substring(newVideo.getOriginalFilename().lastIndexOf("."));
        //uuid
        String uuid = UUID.randomUUID().toString().replace("-","");
        //设置视频的uuid
        video.setId(uuid);


        // 设置视频的类型
        Type type = new Type();
        type.setName(type1);
        video.setType(type);


        String upLoadDic = request.getServletContext().getRealPath("/upload/");
        String videoPath = upLoadDic+"video/"+type1+"/"+video.getId()+"_"+video.getName()+videoFormat;
        String imagePath = upLoadDic+"image/cover/"+video.getId()+imageFormat;
        System.out.println(videoPath);
        System.out.println(imagePath);
        File videoFile = new File(videoPath);
        File photoFile = new File(imagePath);
        newVideo.transferTo(videoFile);
        newImage.transferTo(photoFile);
        video.setPath(videoPath);
        video.setCover(imagePath);
        videoDao.save(video);
        return Result.success("OK");

//        String imageDicPath = request.getServletContext().getRealPath("/upload/image");
//        String filePath = videoDicPath+"/"+video.getId()+"_"+video.getName()+videoFormat;
//        video.setPath(filePath);
//
//
//
//
//
//        File videoFile = new File(filePath);
//        newVideo.transferTo(videoFile);
    }

    @ResponseBody
    @RequestMapping(value = "/typeAll",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String types() throws JsonProcessingException {
        return Result.success("ok",typeDao.getTypes());
    }




    @ResponseBody
    @RequestMapping(value = "/type",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String type(Type type,HttpServletRequest request) throws JsonProcessingException {
        if(typeDao.get(type.getName()) != null){
            return Result.success("您添加的种类已存在");
        }
        UUID uuid = UUID.randomUUID();
        type.setId(uuid.toString().replace("-",""));
        typeDao.save(type);
        String dicPath = request.getServletContext().getRealPath("/upload/video")+"/"+type.getName();
        File file = new File(dicPath);
        if(!file.exists()){
            file.mkdir();
        }
        return Result.success("添加成功");
    }
    @ResponseBody
    @RequestMapping(value = "/search",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String search(Video video, String type1) throws JsonProcessingException {
        System.out.println(video);
        System.out.println(type1);
        Type type = new Type();
        type.setName(type1);
        video.setType(type);
        return Result.success("ok",videoDao.search(video));
    }



}
