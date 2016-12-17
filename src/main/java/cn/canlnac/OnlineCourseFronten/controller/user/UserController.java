package cn.canlnac.OnlineCourseFronten.controller.user;


import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import cn.canlnac.OnlineCourseFronten.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by can on 2016/12/15.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;

    /**
     * 进入个人设置页面
     * @return
     */
    @RequestMapping("profile/show")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();

        Session session = SecurityUtils.getSubject().getSession();
        int id = Integer.parseInt(session.getAttribute("id").toString());

        Profile profile = profileService.findByUserID(id);
        modelAndView.addObject("profile",profile);

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

    /**
     * 修改个人信息
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("change/profile")
    @ResponseBody
    public Map changeProfile(HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        Map returnMap = new HashMap();
        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int id = Integer.parseInt(session.getAttribute("id").toString());
        //获取profile,不存在,则new一个
        Profile profile = profileService.findByUserID(id);
        if (profile == null){
            profile = new Profile();
            profile.setUserId(id);
        }

        //保存图片
        Map map = FileController.saveFlie(request).get(0);
        String url = (String) map.get("url");
        //判断文件是否为图片
        String suffixs = "--jpg--jpeg--png--";
        if (suffixs.indexOf((String) map.get("fileType"))==-1){
            //不是图片
            returnMap.put("error","error-pic-type");
            FileController.deleteFile(url,request);
            return returnMap;
        }
        //超过25KB
        if (Integer.parseInt(map.get("fileSize").toString())>25600){
            returnMap.put("error","error-pic-size");
            FileController.deleteFile(url,request);
            return returnMap;
        }

        //修改session中的头像路径
        session.setAttribute("iconUrl",url);

        //删除服务器中的旧图片
        FileController.deleteFile(profile.getIconUrl(),request);

        //图片名设进对象profile中
        profile.setIconUrl(url);

        profile.setUniversityId(request.getParameter("universityId"));
        profile.setNickname(request.getParameter("nickname"));
        profile.setRealname(request.getParameter("realname"));
        profile.setGender(request.getParameter("sex"));
        profile.setPhone(request.getParameter("phone"));
        profile.setEmail(request.getParameter("email"));
        profile.setDepartment(request.getParameter("department"));
        profile.setMajor(request.getParameter("major"));
        profile.setDormitoryAddress(request.getParameter("dormitoryAddress"));

        int n = profile.getId()!=0?profileService.update(profile):profileService.create(profile);

        //判断添加或修改个人信息成功
        if (n>0){
            returnMap.put("success","success");
            return returnMap;
        } else {
            return null;
        }
    }
}
