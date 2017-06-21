package com.onlineVideo.web.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by niceyuanze on 17-6-17.
 */
public class CustomizedToken extends UsernamePasswordToken {
    private String loginType;
    public CustomizedToken(final String username, final String password,String loginType) {
        super(username,password);
        this.loginType = loginType;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
