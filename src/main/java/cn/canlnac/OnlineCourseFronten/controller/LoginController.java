package cn.canlnac.OnlineCourseFronten.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    @ResponseBody
    public Map login(@RequestParam(value = "username")String userName, @RequestParam(value = "password")String password){
        Map map = new HashMap();
        try {
            //输入判断
            if (!userName.equals("") && !password.equals("")) {
                //使用权限工具进行用户登陆，失败则抛异常
                SecurityUtils.getSubject().login(new UsernamePasswordToken(userName,password));
                //登录成功
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println("用户:"+userName+"于"+sdf.format(new Date())+"登陆成功");
                //Session session = SecurityUtils.getSubject().getSession();
                map.put("msg","success");
            } else {
                map.put("msg","请输入登录用户名、密码");
            }
        } catch (AuthenticationException e) {
            //抛出异常，登陆失败
            map.put("msg","登录用户名或密码错误");
        } finally {
            return map;
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
