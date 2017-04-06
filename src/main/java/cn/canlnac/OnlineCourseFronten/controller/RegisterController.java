package cn.canlnac.OnlineCourseFronten.controller;

import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import cn.canlnac.OnlineCourseFronten.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by can on 2016/12/11.
 * 注册
 */
@Controller
@RequestMapping("register")
public class RegisterController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;

    @RequestMapping("register")
    @ResponseBody
    public Map<String,Object> register(@RequestParam(value="username")String username, @RequestParam(value="password")String password){
        Map<String,Object> map = new HashMap();
        System.out.println(username+":"+password);
        User user = userService.findByUsername(username);
        if (user!=null){
            map.put("msg","errName");
            return map;
        }
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setStatus("active");
        newUser.setUserStatus("student");

        int count = userService.create(newUser);
        if (count == 1){
            Profile profile = new Profile();
            profile.setUserId(newUser.getId());
            profile.setUniversityId("");
            profile.setNickname("");
            profileService.create(profile);
            map.put("msg","success");
            return map;
        } else {
            return null;
        }
    }
}
