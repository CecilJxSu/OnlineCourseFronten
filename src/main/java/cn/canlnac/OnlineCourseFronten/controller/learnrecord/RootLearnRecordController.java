package cn.canlnac.OnlineCourseFronten.controller.learnrecord;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Course;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.entity.LearnRecord;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.service.*;
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
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/learnrecord")
public class RootLearnRecordController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private LearnRecordService learnRecordService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;


    /**
     * 进入学习记录页面
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex() throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        List<Course> courses = new ArrayList<Course>();
        for (Course course:courseService.findByUserId(userId)) {
            if (!course.getStatus().equals("delete")){
                courses.add(course);
            }
        }
        modelAndView.addObject("courses",courses);

        modelAndView.setViewName("/backend/learnrecord");
        return modelAndView;
    }

    /**
     * 获取学习记录
     * @param nowPage       当前页
     * @param sectionId     节id
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public Map getLearnRecord(@RequestParam("nowPage") int nowPage,
                              @RequestParam("section_id") int sectionId){
        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        if (sectionId==0 || courseService.findByID(catalogService.findByID(sectionId).getCourseId()).getUserId()!=userId)
            return null;

        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Map> returnData = new ArrayList<Map>();
        for (LearnRecord learnRecord:learnRecordService.getLearnRecordsByCatalogId(start,count,sectionId)){
            Map unit = new HashMap();
            unit.put("username",userService.findByID(learnRecord.getUserId()).getUsername());
            unit.put("progress",learnRecord.getProgress());
            Profile profile = profileService.findByUserID(learnRecord.getUserId());
            unit.put("universityId",profile.getUniversityId());
            unit.put("realname",profile.getRealname());
            unit.put("email",profile.getEmail());
            unit.put("department",profile.getDepartment());
            unit.put("major",profile.getMajor());
            returnData.add(unit);
        }

        //获取总条数
        int totalNum = learnRecordService.countByCatalogId(sectionId);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("returnData",returnData);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }
}
