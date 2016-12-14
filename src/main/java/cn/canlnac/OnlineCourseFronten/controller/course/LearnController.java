package cn.canlnac.OnlineCourseFronten.controller.course;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("learn")
public class LearnController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private CatalogService catalogService;

    /**
     * 跳转到课程详细
     * @param courseId
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex(@RequestParam("id")int courseId) {
        ModelAndView modelAndView = new ModelAndView();

        //获取课程信息
        Course course = courseService.findByID(courseId);
        modelAndView.addObject("course",course);

        //获取章节
        List chapterAndSection = catalogService.getChapterAndSectionList(courseId);
        modelAndView.addObject("chapterAndSection",chapterAndSection);

        //计算综合评分
        int complex = course.getWatchCount()+course.getLikeCount()+course.getCommentCount()+course.getFavoriteCount();
        modelAndView.addObject("complex",complex);

        //获取学习人数
        int numOfPeople = courseService.getNumOfPeople(course.getId());
        modelAndView.addObject("numOfPeople",numOfPeople);

        modelAndView.setViewName("/frontend/learn");
        return modelAndView;
    }
}
