package cn.canlnac.OnlineCourseFronten.controller.reply;

import cn.canlnac.OnlineCourseFronten.entity.*;
import cn.canlnac.OnlineCourseFronten.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by can on 2016/12/20.
 */
@Controller
@RequestMapping("reply")
public class ReplyController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private MessageService messageService;

    /**
     * 进入回复评论页面
     * @param commentId     评论id
     * @return
     */
    @RequestMapping("show")
    public ModelAndView show(@RequestParam("id") int commentId){
        ModelAndView modelAndView = new ModelAndView();
        Comment comment = commentService.findByID(commentId);
        modelAndView.addObject("comment",comment);
        modelAndView.addObject("user",userService.findByID(comment.getUserId()));
        modelAndView.addObject("profile",profileService.findByUserID(comment.getUserId()));

        modelAndView.setViewName("/frontend/qadetail");
        return modelAndView;
    }

    /**
     * 发表回复
     * @param commentId     评论id
     * @return
     */
    @RequestMapping("post")
    @ResponseBody
    public Map post(@RequestParam("id") int commentId,
                    @RequestParam("content") String content){
        Comment comment = commentService.findByID(commentId);
        //回复对应评论的作者ID
        int toUserId = comment.getUserId();
        Session session = SecurityUtils.getSubject().getSession();
        //回复创建的用户ID
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        Reply reply = new Reply();
        reply.setUserId(userId);
        reply.setToUserId(toUserId);
        reply.setContent(content);
        reply.setCommentId(commentId);
        //回复发表成功
        if (replyService.create(reply)>0){
            //comment评论+1
            Comment update = new Comment();
            update.setId(commentId);
            update.setReplyCount(1);
            commentService.update(update);
            //消息提醒
            Message message = new Message();
            message.setIsRead('N');
            message.setType("comment");
            message.setToUserId(toUserId);
            message.setFromUserId(userId);
            message.setActionType("reply");
            message.setPositionId(commentId);
            message.setContent("有人回复你的评论啦");
            messageService.create(message);
            Map map = new HashMap();
            map.put("msg","success");
            return map;
        }
        return null;
    }

    /**
     * 获取评论列表
     * @param commentId     评论id
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public Map get(@RequestParam("id")int commentId){
        List list = new ArrayList();
        for(Reply reply:replyService.getReplies(commentId)){
            Map map = new HashMap();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            map.put("reply",reply);
            map.put("reply_date",sdf.format(reply.getDate()));
            map.put("user",userService.findByID(reply.getUserId()));
            map.put("profile",profileService.findByUserID(reply.getUserId()));
            list.add(map);
        }
        Map returnMap = new HashMap();
        returnMap.put("list",list);
        return returnMap;
    }
}
