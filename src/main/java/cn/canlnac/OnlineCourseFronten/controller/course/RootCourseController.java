package cn.canlnac.OnlineCourseFronten.controller.course;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
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
import java.util.*;

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
    @Autowired
    private CatalogService catalogService;

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
        List<Course> courses = new ArrayList<Course>();
        for (Course course:courseService.findByUserId(userId)) {
            if (!course.getStatus().equals("delete"))
                courses.add(course);
        }
        modelAndView.addObject("courses",courses);

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
     * 删除课程
     * @param courseId      课程id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(@RequestParam("id") int courseId){
        Course course = new Course();
        course.setId(courseId);
        //设置课程状态为delete
        course.setStatus("delete");

        int i = courseService.update(course);
        return i>0?"success":null;
    }

    /**
     * 修改课程
     * @param courseId          课程id
     * @param name              课程名
     * @param introduction      课程简介
     * @return
     */
    @RequestMapping("update")
    @ResponseBody
    public String update(@RequestParam("id") int courseId,
                         @RequestParam("name") String name,
                         @RequestParam("introduction") String introduction){
        Course course = new Course();
        course.setId(courseId);
        course.setName(name);
        course.setIntroduction(introduction);
        int i = courseService.update(course);
        return i>0?"success":null;
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
     * 管理课程界面获取数据
     * @return
     */
    @RequestMapping("manage/get")
    @ResponseBody
    public Map getCourseManage(@RequestParam("nowPage") int nowPage){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;
        //条件,发表状态和草稿状态
        Map conditions = new HashMap();
        List<String> status = new ArrayList<String>();
        status.add("public");
        status.add("draft");
        conditions.put("status", status);

        List<Course> courses = courseService.getList(start,count,"date",conditions);

        //获取总条数
        int totalNum = courseService.count(conditions);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("courses",courses);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }

    /**
     * 转换课程状态
     * @param courseId      课程id
     * @return
     */
    @RequestMapping("manage/status/change")
    @ResponseBody
    public String changeStatus(@RequestParam("id") int courseId){
        Course course = new Course();
        course.setId(courseId);
        String status = courseService.findByID(courseId).getStatus();
        //如果是发布状态，转草稿状态
        if (status.equals("public"))
            course.setStatus("draft");
        //如果是草稿状态，转发布状态
        if (status.equals("draft"))
            course.setStatus("public");

        int i = courseService.update(course);

        return i>0?"success":null;
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
        List<Document> all = documentService.getDocuments(0,documentService.count("course",courseId,null),"date","course",courseId,null);
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
    public ModelAndView modifycourse(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();

        //获取作者ID
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        Course course = courseService.findByID(id);
        if (course!=null && course.getUserId()==userId){
            modelAndView.addObject("course",course);
        }

        Catalog catalog = catalogService.findByID(id);

        if (catalog!=null && catalog.getParentId()==0 && courseService.findByID(catalog.getCourseId()).getUserId()==userId){
            modelAndView.addObject("courseName",courseService.findByID(catalog.getCourseId()).getName());
            modelAndView.addObject("chapter",catalog);
        }

        if (catalog!=null && catalog.getParentId()!=0 && courseService.findByID(catalog.getCourseId()).getUserId()==userId){
            modelAndView.addObject("courseName",courseService.findByID(catalog.getCourseId()).getName());
            modelAndView.addObject("chapterName",catalogService.findByID(catalog.getParentId()).getName());
            modelAndView.addObject("section",catalog);
            modelAndView.addObject("videoName",documentService.findByUrl(catalog.getUrl()).get(0).getName());
            modelAndView.addObject("videos",documentService.getDocuments(0,documentService.count("course",catalog.getCourseId(),"video"),"date","course",catalog.getCourseId(),"video"));
            modelAndView.addObject("picName",documentService.findByUrl(catalog.getPreviewImage()).get(0).getName());
            modelAndView.addObject("pics",documentService.getDocuments(0,documentService.count("course",catalog.getCourseId(),"img"),"date","course",catalog.getCourseId(),"img"));
            modelAndView.addObject("documents",documentService.getDocuments(0,documentService.count("course",catalog.getCourseId(),null),"date","course",catalog.getCourseId(),null));
            modelAndView.addObject("chooseDocuments",documentService.getDocuments(0,documentService.count("catalog",catalog.getId(),null),"date","catalog",catalog.getId(),null));
        }

        modelAndView.setViewName("/backend/modifycourse");
        return modelAndView;
    }

    /**
     * 进入管理员课程管理页面
     * @return
     */
    @RequestMapping("adminmanage/show")
    public ModelAndView admincoursemanage() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("/backend/admincoursemanage");
        return modelAndView;
    }

    /**
     * 管理员课程界面获取数据
     * @return
     */
    @RequestMapping("adminmanage/get")
    @ResponseBody
    public Map getAdminCourseManage(@RequestParam("nowPage") int nowPage,
                                    @RequestParam("coursename") String coursename){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;
        //条件,删除状态
        Map conditions = new HashMap();
        List<String> status = new ArrayList<String>();
        status.add("delete");
        conditions.put("status", status);
        conditions.put("search",coursename);


        List<Course> courses = courseService.getList(start,count,"date",conditions);

        //获取总条数
        int totalNum = courseService.count(conditions);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("courses",courses);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }
    /**
     * 转换课程状态
     * @param courseId      课程id
     * @return
     */
    @RequestMapping("adminmanage/status/change")
    @ResponseBody
    public String adminchangeStatus(@RequestParam("id") int courseId){
        Course course = new Course();
        course.setId(courseId);
        String status = courseService.findByID(courseId).getStatus();
        //如果是发布状态，转草稿状态
        if (status.equals("delete")){
            course.setStatus("draft");
        }


        int i = courseService.update(course);

        return i>0?"success":null;
    }
}
