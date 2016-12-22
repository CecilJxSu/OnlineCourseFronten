package cn.canlnac.OnlineCourseFronten.controller.chat;

import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("commentdetail")
public class CommentdetailController {

    @Autowired
    ChatService chatService;

    @Autowired
    ProfileService profileService;

    @Autowired
    UserService userService;

    @Autowired
    WatchService watchService;

    @Autowired
    FavoriteService favoriteService;

    @Autowired
    CommentService commentService;

    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        String chatId = request.getParameter("id");//获取话题id

        Chat chat = chatService.findByID(Integer.parseInt(chatId));//获取话题

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String Date=sdf.format(chat.getDate());//时间转换

        ObjectMapper mapper = new ObjectMapper();
        Object PUobject= mapper.readValue(chat.getPictureUrls(),Object.class);//标题图片路径


        Profile profile = profileService.findByUserID(chat.getUserId());//获取发表话题个人信息

        User user =userService.findByID(chat.getUserId());

        int watch=watchService.create("chat",Integer.parseInt(chatId),userId);
        if (watch>0){
            chat.setWatchCount(1);
            chatService.update(chat);
        }

        chat.setCommentCount(commentService.count("chat",chat.getId()));//评论数
        chat.setWatchCount(watchService.count("chat",chat.getId()));//浏览数

        model.put("chat",chat);
        model.put("profile",profile);
        model.put("user",user);
        model.put("PUobject",PUobject);
        model.put("Date",Date);

        return "/frontend/commentdetail";
    }
}
