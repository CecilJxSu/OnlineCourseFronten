package cn.canlnac.OnlineCourseFronten.controller.course;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.LearnRecord;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.LearnRecordService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private LearnRecordService learnRecordService;

    /**
     * 跳转到课程详细
     * @param courseId
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex(@RequestParam("id")int courseId) {
        ModelAndView modelAndView = new ModelAndView();

        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = session.getAttribute("id")!=null?Integer.parseInt(session.getAttribute("id").toString()):0;

        //获取课程信息
        Course course = courseService.findByID(courseId);
        modelAndView.addObject("course",course);

        //获取章节
        if (userId==0) {
            //未登录
            List<Map> chapterAndSection = new ArrayList<Map>();
            for (Map map:catalogService.getChapterAndSectionList(courseId)){
                Map unit = new HashMap();
                unit.put("chapter",map.get("chapter"));
                List<Map> sections = new ArrayList<Map>();
                for (Catalog catalog:(List<Catalog>) map.get("sections")) {
                    Map section = new HashMap();
                    section.put("id",catalog.getId());
                    section.put("date",catalog.getDate());
                    section.put("courseId",catalog.getCourseId());
                    section.put("parentId",catalog.getParentId());
                    section.put("index",catalog.getIndex());
                    section.put("name",catalog.getName());
                    section.put("url",catalog.getUrl());
                    section.put("duration",catalog.getDuration());
                    section.put("previewImage",catalog.getPreviewImage());
                    //学习记录播放百分比为 0
                    section.put("progress", 0);
                    sections.add(section);
                }
                unit.put("sections",sections);
                chapterAndSection.add(unit);
            }
            modelAndView.addObject("chapterAndSection", chapterAndSection);
        } else {
            //已登录
            //顺带获取学习记录播放百分比
            List<Map> chapterAndSection = new ArrayList<Map>();
            for (Map map:catalogService.getChapterAndSectionList(courseId)){
                Map unit = new HashMap();
                unit.put("chapter",map.get("chapter"));
                List<Map> sections = new ArrayList<Map>();
                for (Catalog catalog:(List<Catalog>) map.get("sections")) {
                    Map section = new HashMap();
                    section.put("id",catalog.getId());
                    section.put("date",catalog.getDate());
                    section.put("courseId",catalog.getCourseId());
                    section.put("parentId",catalog.getParentId());
                    section.put("index",catalog.getIndex());
                    section.put("name",catalog.getName());
                    section.put("url",catalog.getUrl());
                    section.put("duration",catalog.getDuration());
                    section.put("previewImage",catalog.getPreviewImage());
                    //获取学习记录
                    LearnRecord learnRecord = learnRecordService.getLearnRecord(catalog.getId(),userId);
                    if (learnRecord!=null) {
                        //记录存在，获取学习进度
                        section.put("progress", learnRecord.getProgress());
                    } else {
                        //记录不存在
                        section.put("progress", 0);
                    }
                    sections.add(section);
                }
                unit.put("sections",sections);
                chapterAndSection.add(unit);
            }
            modelAndView.addObject("chapterAndSection", chapterAndSection);
        }

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
