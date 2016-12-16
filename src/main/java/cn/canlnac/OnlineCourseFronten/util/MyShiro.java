package cn.canlnac.OnlineCourseFronten.util;

import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import cn.canlnac.OnlineCourseFronten.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

/**
 * shiro框架相关
 * 登录认证 及 权限认证 类
 * Created by can on 2016/12/8.
 */
@Transactional
@Component(value = "MyShiro")
public class MyShiro extends AuthorizingRealm{
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;

    /**
     * 权限认证
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录时的用户名
        String loginName=(String) principalCollection.fromRealm(getName()).iterator().next();
        //到数据库查是否有此对象
        User user=userService.findByUsername(loginName);
        if(user!=null){
            //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
            //用户的角色集合
            Set roles = new HashSet();
            roles.add(user.getUserStatus());
            info.setRoles(roles);
            return info;
        }
        return null;
    }

    /**
     * 登录认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //UsernamePasswordToken对象用来存放提交的登录信息
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;
        //查出是否有此用户
        User user=userService.findByUsername(token.getUsername());
        //判断用户是否存在，并且密码是否正确
        if (user!=null && new String(token.getPassword()).equals(user.getPassword())){
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("userName",user.getUsername());
            session.setAttribute("id",user.getId());
            session.setAttribute("userStatus",user.getUserStatus());

            Profile profile = profileService.findByUserID(user.getId());
            if (profile!=null){
                session.setAttribute("iconUrl",profileService.findByUserID(user.getId()).getIconUrl());
            }
            //将此用户存放到登录认证info中
            return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
        }
        return null;
    }
}
