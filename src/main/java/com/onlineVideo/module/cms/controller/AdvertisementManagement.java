package com.onlineVideo.module.cms.controller;

import com.onlineVideo.dao.AdvertisementDao;
import com.onlineVideo.pojo.Advertisement;
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
 * Created by niceyuanze on 17-6-17.
 */
@RestController
@RequestMapping("/cms/advertisementManage")
public class AdvertisementManagement {





    @Autowired
    private AdvertisementDao advertisementDao;


    @ResponseBody
    @RequestMapping(value="/add", method={RequestMethod.POST,RequestMethod.GET},produces = "text/json;charset=UTF-8")
    public String save(Advertisement advertisement,
                       MultipartFile newAdvertisement,
                       HttpServletRequest request) throws IOException {
        System.out.println(advertisement);
        System.out.println(newAdvertisement);

        //获取视频的拓展名
        String advertisementExtension =
                newAdvertisement.getOriginalFilename()
                        .substring(newAdvertisement.getOriginalFilename().lastIndexOf("."));


        //uuid
        String uuid = UUID.randomUUID().toString().replace("-","");
        //设置广告的uuid
        advertisement.setId(uuid);





        String advertisementPath = request.getServletContext().getRealPath("/upload/advertisement/")+uuid+"_"+advertisement.getName()+advertisementExtension;
        File advertisementFile = new File(advertisementPath);
        newAdvertisement.transferTo(advertisementFile);
        advertisement.setPath(advertisementPath);
        advertisementDao.save(advertisement);
        System.out.println(advertisement);

        return Result.success("OK");

    }


    public AdvertisementDao getAdvertisementDao() {
        return advertisementDao;
    }

    public void setAdvertisementDao(AdvertisementDao advertisementDao) {
        this.advertisementDao = advertisementDao;
    }
}
