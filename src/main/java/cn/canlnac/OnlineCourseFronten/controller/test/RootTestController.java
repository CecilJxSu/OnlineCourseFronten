package cn.canlnac.OnlineCourseFronten.controller.test;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Question;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.QuestionService;
import cn.canlnac.OnlineCourseFronten.util.ExcelReader;
import cn.canlnac.OnlineCourseFronten.vo.TestUnit;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.regex.Pattern;

/**
 * 小测
 */
@Controller
@RequestMapping("root/test")
public class RootTestController {
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private QuestionService questionService;


    /**
     * 进入小测页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/testpreview";
    }

    /**
     * 进入小测管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/show")
    public String manage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/testmanage";
    }

    /**
     * 小测试题预览
     * @param request
     * @return
     */
    @RequestMapping("preview")
    @ResponseBody
    public List<Map> preview(HttpServletRequest request){
        return resolve(request);
    }

    /**
     * 解析小测试题
     */
    public List<Map> resolve(HttpServletRequest request){
        String path = "";
        try {
            List<Map> lm = FileController.saveFlie(request);
            path = (String) lm.get(0).get("url");
        } catch (NoSuchAlgorithmException e) {
            return null;
        } catch (IOException e) {
            return null;
        }

        //解析excel表，由于一个excel中只设一个sheet表，所以只取解析后的第一个
        ArrayList<ArrayList<String>> sheet = ExcelReader.parseExcel(FileController.getSourcesDirectory(request)+path).get(0);

        //试卷
        List<Map> test = new ArrayList<Map>();
        //试卷单元模块
        Map testUnit = null;

        //题目类型
        String type = null;
        //每大题总分
        double score = 0 ;
        //题目集合
        List<Map> questions = new ArrayList<Map>();

        //题目单元
        Map questionUnit = null;

        //选项集合
        Map item = null;

        for (int i=0;i<sheet.size();i++){
            //创建试卷单元模块
            //题目类型、每大题总分放进试卷单元模块
            //创建一个新的题目集合
            //进入新题目类型时，做旧题目块结尾处理
            if (sheet.get(i).get(0).equals("单选题")){
                if (questions.size()>0){
                    testUnit.put("questions",questions);
                    test.add(testUnit);
                }
                testUnit = new HashMap();
                type = "单选题";
                score = Double.parseDouble(sheet.get(i).get(2));
                testUnit.put("type",type);
                testUnit.put("score",score);
                questions = new ArrayList<Map>();
            } else if (sheet.get(i).get(0).equals("多选题")){
                if (questions.size()>0){
                    testUnit.put("questions",questions);
                    test.add(testUnit);
                }
                testUnit = new HashMap();
                type = "多选题";
                score = Double.parseDouble(sheet.get(i).get(2));
                testUnit.put("type",type);
                testUnit.put("score",score);
                questions = new ArrayList<Map>();
            } else if (sheet.get(i).get(0).equals("判断题")){
                if (questions.size()>0){
                    testUnit.put("questions",questions);
                    test.add(testUnit);
                }
                testUnit = new HashMap();
                type = "判断题";
                score = Double.parseDouble(sheet.get(i).get(2));
                testUnit.put("type",type);
                testUnit.put("score",score);
                questions = new ArrayList<Map>();
            }

            //创建一个新的题目单元
            //往题目单元中添加题目类型
            //往题目单元中添加题目
            //清空选项集合
            if (sheet.get(i).get(0).equals("题目")){
                questionUnit = new HashMap();
                questionUnit.put("type",type);
                questionUnit.put("question",sheet.get(i).get(1));
                item = new HashMap();
            }
            //设置选项集合
            if (Pattern.compile("[a-zA-Z]").matcher(sheet.get(i).get(0)).matches()){
                item.put(sheet.get(i).get(0),sheet.get(i).get(1));
            }
            //往题目单元中添加选项集合
            //往题目单元中添加答案
            if (sheet.get(i).get(0).equals("答案")){
                questionUnit.put("item",item);
                List answer = new ArrayList();
                if (sheet.get(i).get(1).length()>1){
                    answer = Arrays.asList(sheet.get(i).get(1).split("-\\|-"));
                } else {
                    answer.add(sheet.get(i).get(1)==null?"":sheet.get(i).get(1));
                }
                System.out.println(answer);
                questionUnit.put("answer",answer);
            }
            //往题目单元中添加解析
            //将题目单元加入题目集合
            if (sheet.get(i).get(0).equals("解析")){
                questionUnit.put("explains",sheet.get(i).get(1)==null?"":sheet.get(i).get(1));
                questions.add(questionUnit);
            }
            //为最后一个单元格，做题目块结尾处理
            if (i+1==sheet.size()){
                testUnit.put("questions",questions);
                test.add(testUnit);
            }
        }

        //对于excel文件不做保留，在此进行删除
        FileController.deleteFile(path,request);
        return test;
    }

    /**
     * 因为与移动端逻辑同步，注释测方法，改用B
     * 创建小测
     * @param request
     * @param courseId      课程id
     * @param parentId      章id
     * @param name          小测名称
     * @return
     */
    @RequestMapping("create")
    @ResponseBody
    public String create(HttpServletRequest request,
                         @RequestParam("course_id") int courseId,
                         @RequestParam("parent_id") int parentId,
                         @RequestParam("name") String name){
        List<Map> test = resolve(request);
        double total = 0;
        for (Map map:test) {
            total += Double.parseDouble(map.get("score").toString());
        }
        String json = null;
        try {
            ObjectMapper mapper = new ObjectMapper(); //json转换器
            json = mapper.writeValueAsString(test); //将上传图片转换成json
        } catch (IOException e) {
            return null;
        }
        Question question = new Question();
        question.setCatalogId(parentId);
        question.setName(name);
        question.setQuestions(json);
        question.setTotal((float) total);
        if (questionService.create(question)>0){
            return "success";
        } else {
            return null;
        }
    }

}
