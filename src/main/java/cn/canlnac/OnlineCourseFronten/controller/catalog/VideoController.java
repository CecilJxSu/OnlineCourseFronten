package cn.canlnac.OnlineCourseFronten.controller.catalog;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.LearnRecord;
import cn.canlnac.OnlineCourseFronten.entity.Watch;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.LearnRecordService;
import cn.canlnac.OnlineCourseFronten.service.WatchService;
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

@Controller
@RequestMapping("video")
public class VideoController {
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private WatchService watchService;
    @Autowired
    private LearnRecordService learnRecordService;

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

    /**
     * 保存视频学习时间记录
     * @param sectionId     节id
     * @param totalTime     视频总时长
     * @param nowTime       当前观看时长
     * @return
     */
    @RequestMapping("time")
    @ResponseBody
    public String saveTime(@RequestParam("id") int sectionId,
                       @RequestParam("totalTime") int totalTime,
                       @RequestParam("nowTime") int nowTime){
        //将获取的总时间设进节中
        Catalog catalog = new Catalog();
        catalog.setId(sectionId);
        catalog.setDuration(totalTime);
        catalogService.update(catalog);

        Session session = SecurityUtils.getSubject().getSession();
        //只进行学生的学习记录
        if (session.getAttribute("userStatus").equals("student")){
            int userId = Integer.parseInt(session.getAttribute("id").toString());
            LearnRecord learnRecord = learnRecordService.getLearnRecord(sectionId,userId);
            if (learnRecord == null){
                learnRecord = new LearnRecord();
                learnRecord.setUserId(userId);
                learnRecord.setCatalogId(sectionId);
            }
            double progress = (double) nowTime/ (double) totalTime;
            learnRecord.setProgress(progress);
            learnRecord.setLastPosition(nowTime);

            if (learnRecordService.getLearnRecord(sectionId,userId)==null)
                learnRecordService.create(learnRecord);
            else
                learnRecordService.update(learnRecord);
        }

        return "success";
    }
}
