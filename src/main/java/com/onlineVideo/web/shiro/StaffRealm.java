package com.onlineVideo.web.shiro;

import com.onlineVideo.dao.StaffDao;
import com.onlineVideo.dao.UserDao;
import com.onlineVideo.pojo.Staff;
import com.onlineVideo.pojo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by niceyuanze on 17-6-6.
 */
@Component
public class StaffRealm extends AuthorizingRealm {


    @Autowired
    private StaffDao staffDao;





    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("22222222222222222222222222222222222222222222222");


        String userName = (String)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Staff staff = staffDao.getStaffByLoginname(userName);
        if(staff == null){
            return null;
        }
        authorizationInfo.addRole(staff.getRole().getContent());

        return authorizationInfo;
//        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String loginname = (String) token.getPrincipal();


        Staff staff = staffDao.getStaffByLoginname(loginname);
        System.out.println(staff);

        if (staff == null) {
            // 抛出 帐号找不到异常
            throw new UnknownAccountException();
        }


        ByteSource credentialsSalt = ByteSource.Util.bytes(loginname);

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                loginname, // 用户名
                staff.getPassword(), // 密码
                credentialsSalt,
                getName() // realm name
        );
        return authenticationInfo;



    }


    public StaffDao getStaffDao() {
        return staffDao;
    }

    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }
}
