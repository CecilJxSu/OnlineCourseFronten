package cn.canlnac.OnlineCourseFronten.controller.user;

import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by can on 2016/12/15.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 进入个人设置页面
     * @return
     */
    @RequestMapping("profile/show")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/frontend/setprofile");
        return modelAndView;
    }

    /**
     * 修改密码
     * @param oldPWD
     * @param newPWD
     * @return
     */
    @RequestMapping("change/pwd")
    @ResponseBody
    public Map changePassword(@RequestParam(value="sourcePassword")String oldPWD, @RequestParam(value="newPassword")String newPWD){
        //判断输入是否为空
        if (oldPWD==null || oldPWD.equals("") || newPWD==null || newPWD.equals(""))
            return null;
        Session session = SecurityUtils.getSubject().getSession();
        int id = Integer.parseInt(session.getAttribute("id").toString());
        User user = userService.findByID(id);
        //判断旧密码是否正确
        if (user.getPassword().equals(oldPWD)){
            user.setPassword(newPWD);
            int n = userService.update(user);
            //判断密码修改是否成功
            if (n>0){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println("用户:"+session.getAttribute("userName")+"于"+sdf.format(new Date())+"退出---修改密码");
                SecurityUtils.getSubject().logout();
                Map map = new HashMap();
                map.put("mag","success");
                return map;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}
