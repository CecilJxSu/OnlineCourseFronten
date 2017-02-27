package cn.canlnac.OnlineCourseFronten.controller.message;

import cn.canlnac.OnlineCourseFronten.entity.*;
import cn.canlnac.OnlineCourseFronten.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HaMi on 2016/12/30.
 */
@Controller
@RequestMapping("message")
public class MessageController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    private ChatService chatService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private UserService userService;
    @Autowired
    private WatchService watchService;
    @Autowired
    private LikeService likeService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private MessageService messageService;


    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/frontend/personal";
    }

    /**
     * 获取课程
     * @param nowPage   当前页码
     * @return
     */
    @RequestMapping("course/get")
    @ResponseBody
    public Map getCourse(@RequestParam("nowPage") int nowPage){
        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Map> returnDate = new ArrayList<Map>();
        for (Course course:courseService.getChooseCourse(start,count,userId)) {
            Map unit =  new HashMap();
            unit.put("course",course);
            unit.put("pic",catalogService.getSectionList(catalogService.getChapterList(course.getId()).get(0).getId()).get(0).getPreviewImage());
            unit.put("peopleNum",courseService.getNumOfPeople(course.getId()));
            returnDate.add(unit);
        }

        //获取总条数
        int totalNum = courseService.countChooseCourse(userId);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("returnDate",returnDate);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }

    /**
     * 消息设为已读
     * @param id    消息id
     * @return
     */
    @RequestMapping("message/read")
    @ResponseBody
    public String readMessage(@RequestParam("id") int id,HttpServletRequest request){
        if (messageService.setRead(id)>0){
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("message",messageService.count(Integer.parseInt(session.getAttribute("id").toString()),"N"));
            return "success";
        } else {
            return null;
        }
    }

    /**
     * 删除消息
     * @param id    消息id
     * @return
     */
    @RequestMapping("message/delete")
    @ResponseBody
    public String deleteMessage(@RequestParam("id") int id,HttpServletRequest request){
        if (messageService.delete(id)>0){
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("message",messageService.count(Integer.parseInt(session.getAttribute("id").toString()),"N"));
            return "success";
        } else {
            return null;
        }
    }

    /**
     * 获取消息
     * @param nowPage   当前页码
     * @return
     */
    @RequestMapping("message/get")
    @ResponseBody
    public Map getMessage(@RequestParam("nowPage") int nowPage){
        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Message> messagesN = messageService.getMessages(start,count,userId,"N");
        List<Message> messages = new ArrayList<Message>();
        messages.addAll(messagesN);
        if (messagesN.size()<count && messagesN.size()>0){
            List<Message> messagesY = messageService.getMessages(0,count-messagesN.size(),userId,"Y");
            messages.addAll(messagesY);
        } else if (messagesN.size()==0){
            List<Message> messagesY = messageService.getMessages(start,count-messagesN.size(),userId,"Y");
            messages.addAll(messagesY);
        }

        //填充其他数据
        List<Map> returnDate = new ArrayList<Map>();
        for (Message message : messages){
            Map unit = new HashMap();
            unit.put("messages",message);
            if (message.getType().equals("course")){
                unit.put("title",courseService.findByID(message.getPositionId()).getName());
            } else if (message.getType().equals("chat")){
                unit.put("title",chatService.findByID(message.getPositionId()).getTitle());
            } else if (message.getType().equals("comment")){
                String str = commentService.findByID(message.getPositionId()).getContent();
                unit.put("title",commentService.findByID(message.getPositionId()).getContent());
            } else if (message.getType().equals("system")){
                unit.put("title",message.getContent());
            } else if (message.getType().equals("user")){
                unit.put("title",message.getContent());
            } else {
                unit.put("title","welcome");
            }
            returnDate.add(unit);
        }

        //获取总条数
        int totalNum = messageService.count(userId,"N")+messageService.count(userId,"Y");
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("returnDate",returnDate);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }

    /**
     * 获得收藏的话题
     * @return
     * @throws Exception
     */
    @RequestMapping("favorite/get")
    @ResponseBody
    public Map getFavorite(@RequestParam("nowPage") int nowPage){
        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Map> returnDate = new ArrayList<Map>();
        for (Favorite favorite:favoriteService.getFavorite(start,count,"chat",userId)) {
            Map unit =  new HashMap();
            Chat chat =chatService.findByID(favorite.getTargetId());
            String type="chat";
            unit.put("chat",chatService.findByID(favorite.getTargetId()));
            unit.put("watchCount",watchService.count(type,chat.getId()));
            unit.put("likeCount",likeService.count(type,chat.getId()));
            unit.put("commentCount",commentService.count(type,chat.getId()));
            unit.put("favoriteCount",favoriteService.count(type,chat.getId()));
            unit.put("iconurl",profileService.findByUserID(favorite.getUserId()).getIconUrl());
            unit.put("username",userService.findByID(favorite.getUserId()).getUsername());
            returnDate.add(unit);
        }

        //获取总条数
        int totalNum = favoriteService.countFavorite(userId,"chat");
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("returnDate",returnDate);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }
}
