package cn.canlnac.OnlineCourseFronten.controller.chat;

import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.service.ChatService;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("chat")
public class ChatController {

    @Autowired
    ChatService chatService;

    @Autowired
    ProfileService profileService;

    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/chat";
    }

    @RequestMapping("getchat")
    @ResponseBody
    public Map getchat(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String nowPage = request.getParameter("nowPage");//当前页数

        String hotOrNew = request.getParameter("hotOrNew");//点击查询

        String search = request.getParameter("search");//搜索框查询条件

        //每页显示15条
        int count = 10;
        //分页开始位置
        int start = (Integer.parseInt(nowPage)-1)*count;
        //排序
        String sort = hotOrNew.equals("hot")?"rank":"date";
        //条件
        Map conditions = new HashMap();
        conditions.put("status", Arrays.asList("public"));
        if (search!=null && !search.equals("")){
            conditions.put("search", search);
        }

        //获取数据
        List chats = new ArrayList();
        List<Chat> list = chatService.getList(start,count,sort,conditions);
        for (Chat chat:list) {
            Map unit = new HashMap();
            unit.put("id",chat.getId());
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            unit.put("date",sf.format(chat.getDate()));
            unit.put("title",chat.getTitle());
            unit.put("content",chat.getContent());
            unit.put("userId",chat.getUserId());
            unit.put("pictureUrls",chat.getPictureUrls());
            unit.put("watchCount",chat.getWatchCount());
            unit.put("likeCount",chat.getLikeCount());
            unit.put("commentCount",chat.getCommentCount());
            unit.put("favoriteCount",chat.getFavoriteCount());
            unit.put("profile",profileService.findByUserID(chat.getUserId()));
            chats.add(unit);
        }

        //获取总条数
        int totalNum = chatService.count(conditions);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("chats",chats);
        map.put("totalPage",totalPage);

        return map;
    }
}
