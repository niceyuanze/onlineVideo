package com.onlineVideo.web.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * Created by niceyuanze on 17-6-19.
 */
public class CustomizedModularRealmAuthorizator extends ModularRealmAuthorizer {
    @Override
    public void checkRole(PrincipalCollection principals, String role) throws AuthorizationException {
        super.checkRole(principals, role);
    }
}
