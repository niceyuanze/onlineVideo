package com.onlineVideo.module.login.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.web.base.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by niceyuanze on 17-6-19.
 */
@RestController
@RequestMapping("/logout")
public class Logout {
    @ResponseBody
    @RequestMapping(value="", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String logout() throws JsonProcessingException {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return Result.success("ok");

    }
}
