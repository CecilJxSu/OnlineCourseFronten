package cn.canlnac.OnlineCourseFronten.controller.course;

import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.DocumentService;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/course")
public class RootCourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private DocumentService documentService;

    /**
     * 进入课程创建页面
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();

        //获取作者ID
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        modelAndView.addObject("courses",courseService.findByUserId(userId));

        modelAndView.setViewName("/backend/createcourse");
        return modelAndView;
    }

    /**
     * 添加课程
     * @param name          课程名
     * @param introduction  课程简介
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public String add(@RequestParam("name") String name,
                   @RequestParam("introduction") String introduction){
        if (name.equals(""))
            return null;
        //获取作者ID
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        //获取作者个人信息
        Profile profile = profileService.findByUserID(userId);
        //判断个人信息是否完善
        if (profile == null || profile.getDepartment()==null || profile.getDepartment().equals("")){
            return "profile-err";
        } else {
            Course course = new Course();
            course.setName(name);
            course.setIntroduction(introduction);
            course.setUserId(userId);
            course.setDepartment(profile.getDepartment());
            course.setStatus("draft");//创建时为草稿状态
            //创建课程，并判断是否创建成功
            if (courseService.create(course)>0){
                return "success";
            } else {
                return null;
            }
        }
    }

    /**
     * 根据用户id，获取其创建的课程
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public List<Course> get(){
        //获取作者ID
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        return courseService.findByUserId(userId);
    }

    /**
     * 进入课程管理页面
     * @return
     */
    @RequestMapping("manage/show")
    public ModelAndView coursemanage() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("/backend/coursemanage");
        return modelAndView;
    }

	/**
     * 获取该课程的所有视频资源、所有图片资源、所有资源
     * @param courseId
     * @return
     */
    @RequestMapping("sources/all/get")
    @ResponseBody
    public Map getAllSources(@RequestParam("course_id") int courseId){
        List<Document> videos = new ArrayList<Document>();
        List<Document> pics = new ArrayList<Document>();
        List<Document> all = documentService.getDocuments(0,documentService.count("course",courseId),"date","course",courseId);
        for (Document document : all){
            if (document.getType().equals("video/mp4")){
                videos.add(document);
            }
            if (document.getType().indexOf("image") != -1){
                pics.add(document);
            }
        }
        Map map = new HashMap();
        map.put("videos",videos);
        map.put("pics",pics);
        map.put("all",all);
        return map;
    }

    /**
     * 进入课程修改页面
     * @return
     */
    @RequestMapping("modify/show")
    public ModelAndView modifycourse() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("/backend/modifycourse");
        return modelAndView;
    }
}
