package cn.canlnac.OnlineCourseFronten.controller.chat;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.service.ChatService;
import cn.canlnac.OnlineCourseFronten.util.Img;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    /**
     * 话题创建
     * @param title         标题
     * @param content       文本简介
     * @param html          内容
     * @return
     * @throws IOException
     */
    @RequestMapping("commentupload")
    @ResponseBody
    public String commentupload(@RequestParam("title") String title,
                                @RequestParam("content")  String content,
                                @RequestParam("html")  String html) throws IOException {

        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        //提取图片，并转为json
        List<String> pics = Img.getImgSrc(html);
        String picJSON = null;
        if (pics.size()>0){
            List<String> picurls = new ArrayList<String>();
            //限定9张预览图
            for (int i=0;i<9;i++){
                picurls.add(pics.get(i).substring(pics.get(i).indexOf("=")+1));
            }
            ObjectMapper mapper = new ObjectMapper(); //json转换器
            picJSON = mapper.writeValueAsString(picurls); //将上传图片转换成json
        }

        Chat chat = new Chat();
        chat.setUserId(userId);
        chat.setTitle(title);
        chat.setContent(content);
        chat.setHtml(html);
        chat.setPictureUrls(picJSON);

        return chatService.create(chat)>0?"success":null;
    }

    /**
     * 上传图片
     * @param request
     * @return
     */
    @RequestMapping("upload/img")
    @ResponseBody
    public String uploadImg(HttpServletRequest request){
        try {
            List<Map> list = FileController.saveFlies(request);
            if (list.get(0).get("fileType").toString().indexOf("image")==-1)
                return  null;
            else
                return (String) list.get(0).get("url");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
