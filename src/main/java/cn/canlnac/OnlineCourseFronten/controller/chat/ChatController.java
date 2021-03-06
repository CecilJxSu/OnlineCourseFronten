package cn.canlnac.OnlineCourseFronten.controller.chat;

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

    @Autowired
    LikeService likeService;

    @Autowired
    WatchService watchService;

    @Autowired
    CommentService commentService;

    @Autowired
    FavoriteService favoriteService;

    @Autowired
    MessageService messageService;

    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        model.put("userId",userId);//用户ID

        return "/frontend/chat";
    }


    @RequestMapping("getchat")
    @ResponseBody
    public Map getchat(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        String nowPage = request.getParameter("nowPage");//当前页数

        String hotOrNew = request.getParameter("hotOrNew");//点击查询

        String search = request.getParameter("search");//搜索框查询条件

        String type = "chat";//话题


        //每页显示15条
        int count = 10;
        //分页开始位置
        int start = (Integer.parseInt(nowPage)-1)*count;
        //排序
        String sort = hotOrNew.equals("hot")?"rank":"date";
        //条件
        Map conditions = new HashMap();
        if ("my".equals(hotOrNew)){
            conditions.put("userId",userId);
        }
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
            unit.put("watchCount",watchService.count(type,chat.getId()));
            unit.put("likeCount",likeService.count(type,chat.getId()));
            unit.put("commentCount",commentService.count(type,chat.getId()));
            unit.put("favoriteCount",favoriteService.count(type,chat.getId()));
            unit.put("favorite",favoriteService.isFavorite(userId,type,chat.getId()));
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

    /*用户收藏话题*/
    @RequestMapping("createfavorite")
    @ResponseBody
    public Map favorite(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //从session中获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        String type = request.getParameter("type");//收藏类型

        String chatId = request.getParameter("chatId");//获取话题id

        String title = request.getParameter("title");//标识


        Map map =new HashMap();
        int savefavorite;
        int isfavorite = favoriteService.isFavorite(userId,type,Integer.parseInt(chatId));//是否已收藏

        if ("收藏".equals(title)&&isfavorite==0){
            savefavorite= favoriteService.create(type,Integer.parseInt(chatId),userId);
            if (savefavorite>0){
                Chat chat = new Chat();
                chat.setId(Integer.parseInt(chatId));
                chat.setFavoriteCount(4);
                chatService.update(chat);
                //消息
                Message message = new Message();
                message.setIsRead('N');
                message.setType("chat");
                message.setToUserId(chatService.findByID(Integer.parseInt(chatId)).getUserId());
                message.setFromUserId(Integer.parseInt(session.getAttribute("id").toString()));
                message.setActionType("favorite");
                message.setPositionId(Integer.parseInt(chatId));
                message.setContent("有人收藏你的话题");
                messageService.create(message);
            }

        }

        if ("取消收藏".equals(title)&&isfavorite==1){
            savefavorite= favoriteService.delete(type,Integer.parseInt(chatId),userId);
            if (savefavorite>0){
                Chat chat = new Chat();
                chat.setId(Integer.parseInt(chatId));
                chat.setFavoriteCount(-4);
                chatService.update(chat);
            }
        }
        return map;
    }

    /*用户收藏话题*/
    @RequestMapping("getfavorite")
    @ResponseBody
    public int getFavorite(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int chatId = Integer.parseInt(request.getParameter("id"));
        Session session = SecurityUtils.getSubject().getSession();
        Chat chat = new Chat();
        chat.setId(chatId);
        int isfavorite = favoriteService.isFavorite(Integer.parseInt(session.getAttribute("id").toString()),"chat",chatId);
        if (isfavorite>0){
            //已经收藏,所以-4
            int del = favoriteService.delete("chat",chatId,Integer.parseInt(session.getAttribute("id").toString()));
            if (del > 0){
                chat.setFavoriteCount(-4);
                chatService.update(chat);
            }
        } else {
            //还没收藏,所以收藏+4
            Favorite favorite = new Favorite();
            int crt = favoriteService.create("chat",chatId,Integer.parseInt(session.getAttribute("id").toString()));
            if (crt > 0){
                chat.setFavoriteCount(4);
                chatService.update(chat);
                //消息
                Message message = new Message();
                message.setIsRead('N');
                message.setType("chat");
                message.setToUserId(chatService.findByID(chatId).getUserId());
                message.setFromUserId(Integer.parseInt(session.getAttribute("id").toString()));
                message.setActionType("favorite");
                message.setPositionId(chatId);
                message.setContent("有人收藏你的话题");
                messageService.create(message);
            }
        }
        return favoriteService.count("chat",chatId);
    }

    /*用户点赞话题*/
    @RequestMapping("getlike")
    @ResponseBody
    public int getlike(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int chatId = Integer.parseInt(request.getParameter("id"));
        Session session = SecurityUtils.getSubject().getSession();
        Chat chat = new Chat();
        chat.setId(chatId);
        int isLike = likeService.isLike(Integer.parseInt(session.getAttribute("id").toString()),"chat",chatId);
        if (isLike>0){
            //已经点赞了,所以赞-1
            int del = likeService.delete("chat",chatId,Integer.parseInt(session.getAttribute("id").toString()));
            if (del > 0){
                chat.setLikeCount(-2);
                chatService.update(chat);
            }
        } else {
            //还没点赞,所以赞+1
            Like like = new Like();
            int crt = likeService.create("chat",chatId,Integer.parseInt(session.getAttribute("id").toString()));
            if (crt > 0){
                chat.setLikeCount(2);
                chatService.update(chat);
                //消息
                Message message = new Message();
                message.setIsRead('N');
                message.setType("chat");
                message.setToUserId(chatService.findByID(chatId).getUserId());
                message.setFromUserId(Integer.parseInt(session.getAttribute("id").toString()));
                message.setActionType("like");
                message.setPositionId(chatId);
                message.setContent("有人赞了你的话题");
                messageService.create(message);
            }
        }
        return likeService.count("chat",chatId);
    }
 }
