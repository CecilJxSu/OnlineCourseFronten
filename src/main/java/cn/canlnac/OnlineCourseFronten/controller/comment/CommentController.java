package cn.canlnac.OnlineCourseFronten.controller.comment;

import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.entity.Comment;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.User;
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
    private ReplyService replyService;

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

    @RequestMapping("showComment")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/comment";
    }
}
