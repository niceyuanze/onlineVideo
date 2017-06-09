package com.onlineVideo.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by niceyuanze on 17-6-7.
 */
@RestController
@RequestMapping("/cms")
public class AddStaff {
    @ResponseBody
    @RequestMapping(value="add", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String addStaff(){
        return null;
    }



}
