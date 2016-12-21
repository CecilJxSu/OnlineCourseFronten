package cn.canlnac.OnlineCourseFronten.controller.comment;

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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by can on 2016/12/19.
 */
@Controller
@RequestMapping("comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private ChatService chatService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private LikeService likeService;
    @Autowired
    private MessageService messageService;

    /**
     * 发表评论
     * @param targetType    被评论类型：课程：course；话题：comment
     * @param targetId      被评论id
     * @param content
     * @return
     */
    @RequestMapping("issue")
    @ResponseBody
    public Map issue(@RequestParam("type")String targetType,
                     @RequestParam("id")int targetId,
                     @RequestParam("content")String content){
        Session session = SecurityUtils.getSubject().getSession();
        int userId = (Integer) session.getAttribute("id");

        //创建评论
        Comment comment = new Comment();
        comment.setTargetType(targetType);
        comment.setTargetId(targetId);
        comment.setUserId(userId);
        comment.setContent(content);
        int n = commentService.create(comment);

        //评论发表成功
        if (n>0){
            if (targetType.equals("course")){
                //评论课程
                //每次评论+3
                Course course = new Course();
                course.setId(targetId);
                course.setCommentCount(3);
                courseService.update(course);
            } else if (targetType.equals("chat")){
                //评论话题
                //每次评论+3
                Chat chat = new Chat();
                chat.setId(targetId);
                chat.setCommentCount(3);
                chatService.update(chat);
            }

            Map map = new HashMap();
            map.put("msg","success");
            return map;
        } else {
            return null;
        }
    }

    @RequestMapping("get")
    @ResponseBody
    public Map getComments(@RequestParam("type")String targetType,
                           @RequestParam("id")int targetId,
                           @RequestParam("nowPage") int nowPage){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;
        List list = new ArrayList();
        for (Comment comment:commentService.getList(start,count,"date",targetType,targetId)){
            Map units = new HashMap();
            units.put("comment_id",comment.getId());
            units.put("comment_content",comment.getContent());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            units.put("time",sdf.format(comment.getDate()));
            units.put("like_count",comment.getLikeCount());
            units.put("reply_count",comment.getReplyCount());
            units.put("user",userService.findByID(comment.getUserId()));
            units.put("user_profile",profileService.findByUserID(comment.getUserId()));

            list.add(units);
        }

        //获取总条数
        int totalNum = commentService.count(targetType,targetId);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map resultMap = new HashMap();
        resultMap.put("list",list);
        resultMap.put("totalPage",totalPage);

        return resultMap;
    }

    /**
     * 评论点赞或取消赞
     * @param commentId     评论id
     * @return
     */
    @RequestMapping("like")
    @ResponseBody
    public int like(@RequestParam("id") int commentId){
        Session session = SecurityUtils.getSubject().getSession();
        Comment comment = new Comment();
        comment.setId(commentId);
        int isLike = likeService.isLike(Integer.parseInt(session.getAttribute("id").toString()),"comment",commentId);
        if (isLike>0){
            //已经点赞了,所以赞-1
            int del = likeService.delete("comment",commentId,Integer.parseInt(session.getAttribute("id").toString()));
            if (del > 0){
                comment.setLikeCount(-1);
                commentService.update(comment);
            }
        } else {
            //还没点赞,所以赞+1
            Like like = new Like();
            int crt = likeService.create("comment",commentId,Integer.parseInt(session.getAttribute("id").toString()));
            if (crt > 0){
                comment.setLikeCount(1);
                commentService.update(comment);
                //消息
                Message message = new Message();
                message.setIsRead('N');
                message.setType("comment");
                message.setToUserId(commentService.findByID(commentId).getUserId());
                message.setFromUserId(Integer.parseInt(session.getAttribute("id").toString()));
                message.setActionType("like");
                message.setPositionId(commentId);
                message.setContent("有人赞了你的评论");
                messageService.create(message);
            }
        }
        return commentService.findByID(commentId).getLikeCount();
    }
}
