package cn.canlnac.OnlineCourseFronten.controller.message;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.LearnRecord;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.ChatService;
import cn.canlnac.OnlineCourseFronten.service.FavoriteService;
import cn.canlnac.OnlineCourseFronten.service.LearnRecordService;
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
    FavoriteService favoriteService;

    @Autowired
    ChatService chatService;

    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/frontend/personal";
    }

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
}
