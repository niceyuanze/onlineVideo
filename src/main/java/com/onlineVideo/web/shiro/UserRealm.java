package com.onlineVideo.web.shiro;

import com.onlineVideo.dao.UserDao;
import com.onlineVideo.pojo.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by niceyuanze on 17-6-6.
 */
@Component
public class UserRealm extends AuthorizingRealm {


    @Autowired
    private UserDao userDao;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String loginname = (String) token.getPrincipal();


        User user = userDao.getUserByLoginname(loginname);
        System.out.println(user);

        if (user == null) {
            // 抛出 帐号找不到异常
            throw new UnknownAccountException();
        }

//        Md5Hash md5Hash = new Md5Hash("admin",user.getLoginname(),2);
//        user.setPassword(md5Hash.toString());
        ByteSource credentialsSalt = ByteSource.Util.bytes(loginname);

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                loginname, // 用户名
                user.getPassword(), // 密码
                credentialsSalt,
                getName() // realm name
        );
        return authenticationInfo;



    }





    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
