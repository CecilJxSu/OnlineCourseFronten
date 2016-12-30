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
     * 章修改
     * @param id            章id
     * @param index         章号
     * @param name          章名称
     * @param introduction  章简介
     * @return
     */
    @RequestMapping("chapter/update")
    @ResponseBody
    public String updateChapter(@RequestParam("id") int id,
                                @RequestParam("index")int index,
                                @RequestParam("name") String name,
                                @RequestParam("introduction") String introduction){
        Catalog catalog = new Catalog();
        catalog.setId(id);
        catalog.setIndex(index);
        catalog.setName(name);
        catalog.setIntroduction(introduction);
        return catalogService.update(catalog)>0?"success":null;
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
     * 获取该章下的所有节
     * @param parentId      章id
     * @return
     */
    @RequestMapping("chapter/section/get")
    @ResponseBody
    public List getSection(@RequestParam("parent_id") int parentId){
        List<Catalog> chapters = catalogService.getSectionList(parentId);
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
     * 修改节
     * @param id                    节id
     * @param index                 节号
     * @param name                  节名称
     * @param documentUrl           视频资源路径
     * @param documentImg           预览图资源路径
     * @param documentIds           其他资源id数组
     * @param deleteDocumentIds     要删除资源id数组
     * @return
     */
    @RequestMapping("section/update")
    @ResponseBody
    public String updateSection(@RequestParam("id") int id,
                                @RequestParam("index")int index,
                                @RequestParam("name") String name,
                                @RequestParam("document_url") String documentUrl,
                                @RequestParam("document_img") String documentImg,
                                @RequestParam("document_ids")int[] documentIds,
                                @RequestParam("delete_document_ids")int[] deleteDocumentIds){
        if (id==0 || index==0 || name.equals(""))
            return null;
        Catalog section = new Catalog();
        section.setId(id);
        section.setIndex(index);
        section.setName(name);
        section.setUrl(documentUrl);
        section.setDuration(0);
        section.setPreviewImage(documentImg);
        //修改节，并判断成功与否
        if (catalogService.update(section)<=0)
            return null;
        //为节绑定其他资源
        if (documentIds.length>0){
            for (int i=0;i<documentIds.length;i++){
                Document document = documentService.findByID(documentIds[i]);
                document.setId(0);
                document.setTargetType("catalog");
                document.setTargetId(id);
                documentService.create(document);
            }
        }
        //删除要删的资源
        if (deleteDocumentIds.length>0){
            for (int i=0;i<deleteDocumentIds.length;i++){
                documentService.delete(deleteDocumentIds[i]);
            }
        }
        return "success";
    }

    /**
     * 进入章管理页面
     * @return
     */
    @RequestMapping("manage/show")
    public ModelAndView manage(@RequestParam("id") int courseId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("courseId",courseId);
        modelAndView.setViewName("/backend/catalogmanage");
        return modelAndView;
    }

    /**
     * 章管理获取数据
     * @param nowPage       当前页
     * @param courseId      课程id
     * @return
     */
    @RequestMapping("manage/get")
    @ResponseBody
    public Map getManage(@RequestParam("nowPage") int nowPage,
                         @RequestParam("id") int courseId){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Catalog> list = catalogService.getChapterList(courseId);
        List<Catalog> catalogs = new ArrayList<Catalog>();
        int x = start+count-list.size();
        if (x<=0)
            catalogs.addAll(list.subList(start,count));
        else
            catalogs.addAll(list.subList(start,count-x));

        //获取总条数
        int totalNum = list.size();
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("catalogs",catalogs);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }

    /**
     * 进入节管理页面
     * @param chapterId
     * @return
     * @throws Exception
     */
    @RequestMapping("section/show")
    public ModelAndView sectionmanage(@RequestParam("id") int chapterId) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("chapterId",chapterId);
        modelAndView.addObject("courseId",catalogService.findByID(chapterId).getCourseId());

        modelAndView.setViewName("/backend/sectionmanage");
        return modelAndView;
    }

    /**
     * 章管理获取数据
     * @param nowPage       当前页
     * @param chapterId     章id
     * @return
     */
    @RequestMapping("section/get")
    @ResponseBody
    public Map getSectionManage(@RequestParam("nowPage") int nowPage,
                                @RequestParam("id") int chapterId){
        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (nowPage-1)*count;

        List<Catalog> list = catalogService.getSectionList(chapterId);
        List<Catalog> sections = new ArrayList<Catalog>();
        int x = start+count-list.size();
        if (x<=0)
            sections.addAll(list.subList(start,count));
        else
            sections.addAll(list.subList(start,count-x));

        //获取总条数
        int totalNum = list.size();
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("sections",sections);
        map.put("totalPage",totalPage>0?totalPage:1);
        return map;
    }

    /**
     * 删除章节
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(@RequestParam("id") int id){
        if (catalogService.findByID(id).getParentId()==0){
            //章删除
            if (catalogService.delete(id)>0){
                //同时删除其下所有节以及节资源
                for (Catalog catalog:catalogService.getSectionList(id)){
                    if (catalogService.delete(catalog.getId())>0){
                        for (Document document:documentService.getDocuments(0,1000,"date","catalog",catalog.getId(),null)) {
                            documentService.delete(document.getId());
                        }
                    }
                }
                return "success";
            } else
                return null;
        } else {
            //节删除
            if (catalogService.delete(id)>0){
                for (Document document:documentService.getDocuments(0,1000,"date","catalog",id,null)) {
                    documentService.delete(document.getId());
                }
                return "success";
            } else {
                return null;
            }
        }
    }
}
