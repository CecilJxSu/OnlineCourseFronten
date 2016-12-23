package cn.canlnac.OnlineCourseFronten.controller.document;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("root/document")
public class RootDocumentController {
    @Autowired
    private DocumentService documentService;

    /**
     * 进入上传资源页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("ul/show")
    public String ulresourse(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/uploadresource";
    }

    /**
     * 进入资源管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/soursemanage";
    }

    @RequestMapping("ul/video")
    @ResponseBody
    public String uploadVideo(@RequestParam("course_id") String courseId,
                              HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        List<Map> list = FileController.saveFlie(request);
        System.out.println(list.toString());
        return "success";
    }
}
