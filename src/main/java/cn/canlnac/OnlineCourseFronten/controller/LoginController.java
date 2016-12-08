package cn.canlnac.OnlineCourseFronten.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by can on 2016/12/7.
 */
@Controller
@RequestMapping("/")
public class LoginController {

    /**
     * 登陆
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping(value = "login")
    public String login(@RequestParam(value = "userName")String userName, @RequestParam(value = "password")String password){
        try {
            //输入判断
            if (!userName.equals("") && !password.equals("")) {
                //使用权限工具进行用户登陆，失败则抛异常
                SecurityUtils.getSubject().login(new UsernamePasswordToken(userName,password));
                //登录成功
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println("用户:"+userName+"于"+sdf.format(new Date())+"登陆成功");
                Session session = SecurityUtils.getSubject().getSession();
                //userStatus:用户角色
                String userStatus = (String) session.getAttribute("userStatus");
                //不同角色跳转不同页面
                if(userStatus.equals("admin")){
                    return "success_admin";
                } else if (userStatus.equals("teacher")){
                    return "success_taacher";
                } else {
                    return "success_student";
                }
            }
        } catch (AuthenticationException e) {
            System.out.println(e);
            //抛出异常，登陆失败
            return "redirect:/index/user";
        } finally {
            return "redirect:/index/user";
        }
    }

    /**
     * 退出
     * @param
     * @return
     */
    @RequestMapping(value="/logout")
    public String logout(RedirectAttributes redirectAttributes){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Session session = SecurityUtils.getSubject().getSession();
        System.out.println("用户:"+session.getAttribute("userName")+"于"+sdf.format(new Date())+"退出");
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/";
    }
}
