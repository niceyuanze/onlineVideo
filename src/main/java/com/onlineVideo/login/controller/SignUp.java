package com.onlineVideo.login.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.login.dao.UserDao;
import com.onlineVideo.login.pojo.User;
import com.onlineVideo.login.service.LoginService;
import com.onlineVideo.web.base.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by niceyuanze on 17-6-9.
 */
@RestController
@RequestMapping("signUp/user")
public class SignUp {

    @Autowired
    private UserDao userDao;

    @Autowired
    private LoginService loginService;

    @ResponseBody
    @RequestMapping(value="", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String signUp(User user) throws JsonProcessingException {
        String password = user.getPassword();
        Md5Hash md5Hash = new Md5Hash(user.getPassword(),user.getLoginname(),2);
        user.setPassword(md5Hash.toString());
        userDao.saveUser(user);

        //如果注册成功那么就登录
        Subject subject = SecurityUtils.getSubject();
        String error = loginService.login(subject,user.getLoginname(),password);
        if(error != null){
            return Result.success(error);
        }


        return Result.success("ok");
    }
}
