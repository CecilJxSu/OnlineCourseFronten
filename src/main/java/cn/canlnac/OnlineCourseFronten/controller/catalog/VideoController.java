package cn.canlnac.OnlineCourseFronten.controller.catalog;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.Watch;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.WatchService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("video")
public class VideoController {
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private WatchService watchService;

    /**
     * 进入视频观看页面
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("show")
    public ModelAndView showIndex(@RequestParam(value = "id") int id) throws Exception {
        Catalog catalog = catalogService.findByID(id);
        //课程表观看+1
        Course course = new Course();
        course.setId(catalog.getCourseId());
        course.setWatchCount(1);
        courseService.update(course);
        //添加观看表记录
        Session session = SecurityUtils.getSubject().getSession();
        watchService.create("catalog",id,(Integer) session.getAttribute("id"));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("catalog",catalog);
        modelAndView.setViewName("/frontend/video");

        return modelAndView;
    }
}
