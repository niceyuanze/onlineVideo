package com.onlineVideo.module.login.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.dao.StaffDao;
import com.onlineVideo.dao.UserDao;
import com.onlineVideo.module.login.service.LoginService;
import com.onlineVideo.pojo.Staff;
import com.onlineVideo.web.base.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by niceyuanze on 17-6-17.
 */
@RestController
@RequestMapping("/login/staff")
public class StaffLogin {

    @Autowired
    private StaffDao staffDao;

    @Autowired
    private LoginService loginService;

    @ResponseBody
    @RequestMapping(value="", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public Object login(String loginname, String password, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        System.out.println(loginname);
        System.out.println(password);
        //获取当前对象
        Subject subject = SecurityUtils.getSubject();
        //如果已经登录,那么就不用登录啦
        if(subject.isAuthenticated()){
            return Result.success("ok");
        }
        //登录
        String error = loginService.staffLogin(subject,loginname,password);
        //登录方法返回的字符串不为空,那么就说明登录有问题
        if(error != null){
            return  Result.success(error);
        }
        Staff staff = staffDao.getStaffByLoginname(loginname);
        //登录成功
        return  Result.success("ok",staff);

    }


}
