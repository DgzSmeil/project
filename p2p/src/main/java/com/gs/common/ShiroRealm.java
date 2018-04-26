package com.gs.common;

import com.gs.bean.HUser;
import com.gs.service.HUserService;
import com.gs.service.JurService;
import com.gs.service.RoleService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/1/2.
 */
@Component
public class ShiroRealm extends AuthorizingRealm {
    @Autowired
    private HUserService hUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private JurService jurService;


    //获取相关授权信息
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection){
        String phone = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(CollectionUtils.listToSet(roleService.listRoles(phone)));//获取角色信息
        authorizationInfo.setStringPermissions(CollectionUtils.listToSet(jurService.listJurs(phone)));//获取权限信息
        return authorizationInfo;
    }

    //获取相关认证信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String phone = (String)authenticationToken.getPrincipal();
        String pwd = String.valueOf((char[]) authenticationToken.getCredentials());
        HUser hUser = hUserService.getByPhonePwd(phone,pwd);
        if(hUser != null){
            return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(),authenticationToken.getCredentials(),"shiroRealm");
        }
        return null;
    }


}
