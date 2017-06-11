package com.onlineVideo.module.cms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.dao.TypeDao;
import com.onlineVideo.dao.VideoDao;
import com.onlineVideo.pojo.Type;
import com.onlineVideo.pojo.Video;
import com.onlineVideo.web.base.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
    public String save(Video video,String type1, MultipartFile newVideo, HttpServletRequest request) throws IOException {
        String format =
                newVideo.getOriginalFilename()
                        .substring(newVideo.getOriginalFilename().lastIndexOf("."));
        UUID uuid = UUID.randomUUID();
        video.setId(uuid.toString().replace("-",""));
        Type type = new Type();
        type.setName(type1);
        video.setType(type);
        String dicPath = request.getServletContext().getRealPath("/upload/video")+"/"+type1;
        String filePath = dicPath+"/"+video.getId()+"_"+video.getName()+format;
        video.setPath(filePath);



        videoDao.save(video);


        File videoFile = new File(filePath);
        newVideo.transferTo(videoFile);
        return "OK";
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


}
