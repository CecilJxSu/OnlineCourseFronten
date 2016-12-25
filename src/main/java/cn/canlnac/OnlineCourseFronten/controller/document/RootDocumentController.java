package cn.canlnac.OnlineCourseFronten.controller.document;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
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
import java.util.HashMap;
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
    @Autowired
    private CourseService courseService;
    @Autowired
    private CatalogService catelogService;

    /**
     * 进入上传资源页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("ul/show")
    public ModelAndView ulresourse(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //获取用户id
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());

        modelAndView.addObject("courses",courseService.findByUserId(userId));

        modelAndView.setViewName("/backend/uploadresource");
        return modelAndView;
    }

    /**
     * 进入资源管理页面
     * @return
     */
    @RequestMapping("manage/show")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();

        //获取作者ID
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        modelAndView.addObject("courses",courseService.findByUserId(userId));

        modelAndView.setViewName("/backend/soursemanage");
        return modelAndView;
    }

    /**
     * 获取资源分页列表
     * @param nowPage       当前页
     * @param courseId      课程id
     * @param type          资源类型
     * @return
     */
    @RequestMapping("manage/get")
    @ResponseBody
    public Map getDocument(@RequestParam("nowPage") int nowPage,
                           @RequestParam("course") int courseId,
                           @RequestParam("type") String type){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Document> documents = documentService.getDocuments(start,count,"date","course",courseId,type);

        //获取总条数
        int totalNum = documentService.count("course",courseId,type);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map resultMap = new HashMap();
        resultMap.put("documents",documents);
        resultMap.put("totalPage",totalPage==0?1:totalPage);
        return resultMap;
    }

    /**
     * 删除资源
     * @param id        资源id
     * @return
     */
    @RequestMapping("manage/delete")
    @ResponseBody
    public String deleteDocument(@RequestParam("id") int id,HttpServletRequest request){
        List<Document> documents = documentService.findByUrl(documentService.findByID(id).getUrl());
        int n = 0;
        for (Document document:documents) {
            if (documentService.delete(document.getId())>0){
                FileController.deleteFile(document.getUrl(),request);
                n++;
            }
        }
        return n>0?"success":null;
    }

    /**
     * 上传视频资源
     * @param courseId      课程id
     * @param request
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping("ul/video")
    @ResponseBody
    public String uploadVideo(@RequestParam("course_id") int courseId,
                              HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        List<Map> list = FileController.saveFlies(request);
        int count = 0;
        for (Map map:list) {
            if (map.get("fileType").toString().equals("video/mp4")) {
                Document document = new Document();
                document.setTargetType("course");
                document.setTargetId(courseId);
                document.setName((String) map.get("fileName"));
                document.setSize(Integer.parseInt(map.get("fileSize").toString()));
                document.setUrl((String) map.get("url"));
                document.setType((String) map.get("fileType"));
                count += documentService.create(document);
            }
        }
        return count>0?"success":null;
    }

    /**
     * 上传其他资源
     * @param courseId      课程id
     * @param request
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping("ul/other")
    @ResponseBody
    public String uploadOther(@RequestParam("course_id") int courseId,
                              HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        List<Map> list = FileController.saveFlies(request);
        int count = 0;
        for (Map map:list) {
            Document document = new Document();
            document.setTargetType("course");
            document.setTargetId(courseId);
            document.setSize(Integer.parseInt(map.get("fileSize").toString()));
            document.setName((String) map.get("fileName"));
            document.setType((String) map.get("fileType"));
            document.setUrl((String) map.get("url"));
            count += documentService.create(document);
        }
        return count>0?"success":null;
    }
}
