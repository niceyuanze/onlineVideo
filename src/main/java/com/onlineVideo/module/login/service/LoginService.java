package com.onlineVideo.module.login.service;

import com.onlineVideo.web.shiro.CustomizedToken;
import com.onlineVideo.web.shiro.LoginType;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

/**
 * Created by niceyuanze on 17-6-9.
 */
@Component
public class LoginService {

    private static final String USER_LOGIN_TYPE = LoginType.USER.toString();
    private static final String ADMIN_LOGIN_TYPE = LoginType.ADMIN.toString();


    public String login(Subject subject, String loginname, String password){

        CustomizedToken token = new CustomizedToken(loginname,
                password,USER_LOGIN_TYPE);

        String error = null;

        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户不存在请重新输入";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            error = "登录失败多次，账户锁定10分钟";
        } catch (AuthenticationException e) {
            // 其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }
        return error;
    }

    public String staffLogin(Subject subject, String loginname, String password){

        CustomizedToken token = new CustomizedToken(loginname,
                password,ADMIN_LOGIN_TYPE);
        System.out.println("asdfasdfasdfsadf");




        String error = null;


        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户不存在请重新输入";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            error = "登录失败多次，账户锁定10分钟";
        } catch (AuthenticationException e) {
            // 其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }
        return error;
    }
}
