package cn.canlnac.OnlineCourseFronten.controller;

import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by HaMi on 2016/12/2.
 */
@Controller
@RequestMapping("index")
public class IndexController {
    @Autowired
    private CourseService courseService;

    @RequestMapping("user")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("frontend/index");
        return modelAndView;
    }

    /**
     * 首页最热推荐、最新推荐
     * @return
     */
    @RequestMapping("user/hot-new")
    @ResponseBody
    public Map<String,Object> hotAndNew(){
        Map<String, Object> conditions = new HashMap();
        conditions.put("status", Arrays.asList("public"));
        List hotList = new ArrayList();
        for (Course course:courseService.getList(0,5,"rank",conditions)) {
            Map hot = new HashMap();
            hot.put("id",course.getId());
            hot.put("name",course.getName());
            hot.put("introduction",course.getIntroduction());
            hot.put("complex",course.getWatchCount()+course.getLikeCount()+course.getCommentCount()+course.getFavoriteCount());
            hot.put("numOfPeople",courseService.getNumOfPeople(course.getId()));
            hotList.add(hot);
        }
        List newList = new ArrayList();
        for (Course course:courseService.getList(0,5,"date",conditions)) {
            Map newc = new HashMap();
            newc.put("id",course.getId());
            newc.put("name",course.getName());
            newc.put("introduction",course.getIntroduction());
            newc.put("numOfPeople",courseService.getNumOfPeople(course.getId()));
            newc.put("complex",course.getWatchCount()+course.getLikeCount()+course.getCommentCount()+course.getFavoriteCount());
            newList.add(newc);
        }
        Map<String,Object> map = new HashMap();
        map.put("hotList",hotList);
        map.put("newList",newList);
        return map;
    }

    @RequestMapping("teach")
    public ModelAndView showIndexteach() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("frontend/index");
        return modelAndView;
    }

}
