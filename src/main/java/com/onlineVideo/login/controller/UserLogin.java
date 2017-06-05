package com.onlineVideo.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by niceyuanze on 17-6-3.
 */
@RestController
@RequestMapping("/login/user")
public class UserLogin {
    @ResponseBody
    @RequestMapping(value="login", method = RequestMethod.GET,produces = "text/json;charset=UTF-8")

    public String login(String loginname,String password){


        return "ok";
    }
}
