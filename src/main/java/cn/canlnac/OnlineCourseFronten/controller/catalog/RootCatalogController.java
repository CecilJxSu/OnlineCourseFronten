package cn.canlnac.OnlineCourseFronten.controller.catalog;

import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.CourseService;
import cn.canlnac.OnlineCourseFronten.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/catalog")
public class RootCatalogController {
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private DocumentService documentService;

    /**
     * 添加章
     * @param courseId      课程id
     * @param index         章号，第X章
     * @param name          章名称
     * @param introduction  章简介
     */
    @RequestMapping("chapter/add")
    @ResponseBody
    public String addChapter(@RequestParam("course_id") int courseId,
                           @RequestParam("index")int index,
                           @RequestParam("name") String name,
                           @RequestParam("introduction") String introduction){
        if (name.equals(""))
            return null;
        Catalog catalog = new Catalog();
        catalog.setCourseId(courseId);
        catalog.setParentId(0);
        catalog.setIndex(index);
        catalog.setName(name);
        catalog.setIntroduction(introduction);
        if (catalogService.create(catalog)>0){
            return "success";
        } else {
            return null;
        }
    }

    /**
     * 获取该课程下的所有章
     * @param courseId      课程id
     * @return
     */
    @RequestMapping("chapter/get")
    @ResponseBody
    public List getChapter(@RequestParam("course_id") int courseId){
        List<Catalog> chapters = new ArrayList<Catalog>();
        for (Catalog catalog : catalogService.getList(courseId)){
            if (catalog.getParentId()==0)
                chapters.add(catalog);
        }
        return chapters;
    }

    /**
     * 添加节
     * @param courseId          课程id
     * @param parentId          章id
     * @param index             节号，第X节
     * @param name              节名称
     * @param documentUrlId     视频资源id
     * @param documentImgId     预览图资源id
     * @param documentIds       其他资源id
     * @return
     */
    @RequestMapping("section/add")
    @ResponseBody
    public String addSection(@RequestParam("course_id") int courseId,
                           @RequestParam("parent_id") int parentId,
                           @RequestParam("index")int index,
                           @RequestParam("name") String name,
                           @RequestParam("document_url_id") int documentUrlId,
                           @RequestParam("document_img_id") int documentImgId,
                           @RequestParam("document_ids")int[] documentIds){
        if (courseId==0 || parentId==0 || index==0 || name.equals(""))
            return null;
        Catalog catalog = new Catalog();
        catalog.setCourseId(courseId);
        catalog.setParentId(parentId);
        catalog.setIndex(index);
        catalog.setName(name);
        catalog.setUrl(documentService.findByID(documentUrlId).getUrl());
        catalog.setPreviewImage(documentService.findByID(documentImgId).getUrl());
        //创建节，并判断成功与否
        if (catalogService.create(catalog)<=0){
            return null;
        }
        //为节绑定其他资源
        if (documentIds.length>0){
            for (int i=0;i<documentIds.length;i++){
                Document document = documentService.findByID(documentIds[i]);
                document.setId(0);
                document.setTargetType("catalog");
                document.setTargetId(catalog.getId());
                documentService.create(document);
            }
        }
        return "success";
    }

    /**
     * 进入章管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/show")
    public String manage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/catalogmanage";
    }

    /**
     * 进入节管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("section/show")
    public String sectionmanage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/sectionmanage";
    }
}
