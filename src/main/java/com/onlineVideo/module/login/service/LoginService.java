package com.onlineVideo.module.login.service;

import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

/**
 * Created by niceyuanze on 17-6-9.
 */
@Component
public class LoginService {

    public String login(Subject subject, String loginname, String password){

        UsernamePasswordToken token = new UsernamePasswordToken(loginname,
                password);

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
