package cn.canlnac.OnlineCourseFronten.controller.course;

import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    /**
     * 进入课程页面
     * @param search    搜索框条件
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex(@RequestParam(value = "search",defaultValue = "")String search) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("search",search);

        modelAndView.setViewName("/frontend/course");
        return modelAndView;
    }

    /**
     * 获取课程信息
     * @param nowPage   当前页码
     * @param hotOrNew  最热|最新
     * @param search    搜索框条件
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public Map getCourse(@RequestParam(value="nowPage")int nowPage,
                         @RequestParam(value="hotOrNew")String hotOrNew,
                         @RequestParam(value="search")String search){
        //每页显示15条
        int count = 15;
        //分页开始位置
        int start = (nowPage-1)*count;
        //排序
        String sort = hotOrNew.equals("hot")?"rank":"date";
        //条件
        Map conditions = new HashMap();
        conditions.put("status", Arrays.asList("public"));
        if (search!=null && !search.equals("")){
            conditions.put("search", search);
        }

        //获取数据
        List courses = new ArrayList();
        List<Course> list = courseService.getList(start,count,sort,conditions);
        for (Course course:list) {
            Map unit = new HashMap();
            unit.put("id",course.getId());
            unit.put("name",course.getName());
            unit.put("introduction",course.getIntroduction());
            unit.put("complex",course.getCommentCount()+course.getWatchCount()+course.getLikeCount()+course.getFavoriteCount());
            unit.put("numOfPeople",courseService.getNumOfPeople(course.getId()));
            courses.add(unit);
        }

        //获取总条数
        int totalNum = courseService.count(conditions);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("courses",courses);
        map.put("totalPage",totalPage);
        return map;
    }
}
