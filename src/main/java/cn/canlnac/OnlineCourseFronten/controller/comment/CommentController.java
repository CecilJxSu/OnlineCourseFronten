package cn.canlnac.OnlineCourseFronten.controller.comment;

import cn.canlnac.OnlineCourseFronten.entity.Chat;
import cn.canlnac.OnlineCourseFronten.entity.Comment;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.service.ChatService;
import cn.canlnac.OnlineCourseFronten.service.CommentService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
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
import java.util.HashMap;
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

    /**
     * 发表评论
     * @param targetType
     * @param targetId
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

    @RequestMapping("showComment")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/comment";
    }
}
