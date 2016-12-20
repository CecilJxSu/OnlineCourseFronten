package cn.canlnac.OnlineCourseFronten.controller.chat;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.service.ChatService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("createcomment")
public class CreatecommentController {

    @Autowired
    ChatService chatService;

    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/createcomment";
    }

    @RequestMapping("commentupload")
    public String commentupload( HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException, NoSuchAlgorithmException {

        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        String title = request.getParameter("title");//获取话题

        String content = request.getParameter("info");//获取话题内容

        List<Map> picturelist = FileController.saveFlie(request);
        List list = new ArrayList();

        //封装上传图片
        for(int i=0;i<picturelist.size();i++){
            list.add(picturelist.get(i).get("url"));
        }

        ObjectMapper mapper = new ObjectMapper(); //json转换器
        String picturejson=mapper.writeValueAsString(list); //将上传图片转换成json

        //封装上传好数据
        Chat chat =new Chat();
        chat.setTitle(title);
        chat.setContent(content);
        chat.setUserId(userId);
        chat.setPictureUrls(picturejson);

        //存入数据库
        int createcomment = chatService.create(chat);

        if (createcomment==0){
            model.put("create","createfail");
        }

        if (createcomment>0){
            model.put("create","createsuccess");
        }

        return "/frontend/savecomment";

    }
}
