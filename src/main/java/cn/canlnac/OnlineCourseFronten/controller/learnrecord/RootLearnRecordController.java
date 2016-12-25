package cn.canlnac.OnlineCourseFronten.controller.learnrecord;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.DocumentService;
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
import java.util.List;
import java.util.Map;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/learnrecord")
public class RootLearnRecordController {


    /**
     * 进入学习记录页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/learnrecord";
    }

}
