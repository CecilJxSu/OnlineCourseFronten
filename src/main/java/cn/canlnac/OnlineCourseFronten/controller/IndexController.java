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
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("user/hot-new")
    @ResponseBody
    public Map<String,Object> hotAndNew(){
        Map<String, Object> conditions = new HashMap();
        conditions.put("status", Arrays.asList("public"));
        List<Course> hotList = courseService.getList(0,5,"rank",conditions);
        List<Course> newList = courseService.getList(0,5,"date",conditions);
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
