package cn.canlnac.OnlineCourseFronten.controller.test;

import cn.canlnac.OnlineCourseFronten.controller.FileController;
import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Question;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.QuestionService;
import cn.canlnac.OnlineCourseFronten.util.ExcelReader;
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
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public Map preview(HttpServletRequest request){
        return resolve(request);
    }

    /**
     * 解析小测试题
     */
    public Map resolve(HttpServletRequest request){
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

        //questions指代题目
        Map questions = new HashMap();
        //questionList指代题目集合，例如：单项选择题下所有题目为一个集合
        List<Map> questionList = null;
        //questionUnits指代一条完整的题目，例如：包括题目、选项、答案、解析
        Map questionUnits = null;

        //Option指代选项
        Map option = null;
        //用于记录当前题目快的类型名称
        String questionName = null;

        //answers指代答案
        Map answers = new HashMap();
        //answerList指代答案集合，例如：单项选择题下所有答案为一个集合
        List<String> answerList = null;

        //answers指代各类型题目总条数
        Map totalNums = new HashMap();
        int totalNum = 0;
        for (int i=0;i<sheet.size();i++){
            //创建一个新的题目集合
            //创建一个新的选项集合
            //进入新题目类型时，做旧题目块结尾处理
            if (sheet.get(i).get(0).equals("单项选择题(Single choice)")){
                questionList = new ArrayList<Map>();
                option = new HashMap();
                questionName = "SingleChoice";
                answerList = new ArrayList<String>();
            } else if (sheet.get(i).get(0).equals("不定项选择题(Indefinite item multiple choice)")){
                questions.put(questionName,questionList);
                answers.put(questionName,answerList);
                totalNums.put(questionName,totalNum);
                questionList = new ArrayList<Map>();
                option = new HashMap();
                questionName = "IndefiniteItemMultipleChoice";
                answerList = new ArrayList<String>();
            }
            //创建一个新的题目单元
            //往题目单元中添加题目
            //题目条数+1
            if (sheet.get(i).get(0).equals("题目(topic)")){
                questionUnits = new HashMap();
                questionUnits.put("topic",sheet.get(i).get(1));
                totalNum++;
            }
            //设置选项集合
            if (Pattern.compile("[a-zA-Z]").matcher(sheet.get(i).get(0)).matches()){
                option.put(sheet.get(i).get(0),sheet.get(i).get(1));
            }
            //往题目单元中添加选项集合
            //往题目单元中添加答案
            //往答案集合中添加答案
            if (sheet.get(i).get(0).equals("答案(answer)")){
                questionUnits.put("option",option);
                questionUnits.put("answer",sheet.get(i).get(1)==null?"":sheet.get(i).get(1));
                answerList.add(sheet.get(i).get(1)==null?"":sheet.get(i).get(1));
            }
            //往题目单元中添加解析
            //将题目单元加入题目集合
            if (sheet.get(i).get(0).equals("解析(resolve)")){
                questionUnits.put("resolve",sheet.get(i).get(1)==null?"":sheet.get(i).get(1));
                questionList.add(questionUnits);
            }
            //为最后一个单元格，做题目块结尾处理
            if (i+1==sheet.size()){
                questions.put(questionName,questionList);
                answers.put(questionName,answerList);
                totalNums.put(questionName,totalNum);
            }
        }

        Map questionsAndanswers = new HashMap();
        questionsAndanswers.put("questions",questions);
        questionsAndanswers.put("answers",answers);
        questionsAndanswers.put("totalNums",totalNums);

        //对于excel文件不做保留，在此进行删除
        FileController.deleteFile(path,request);
        return questionsAndanswers;
    }

    /**
     * 创建小测
     * @param request
     * @param courseId      课程id
     * @param parentId      章id
     * @param index         节号
     * @param name          小测名称
     * @param score         总分
     * @return
     */
    @RequestMapping("create")
    @ResponseBody
    public String create(HttpServletRequest request,
                         @RequestParam("course_id") int courseId,
                         @RequestParam("parent_id") int parentId,
                         @RequestParam("index") int index,
                         @RequestParam("name") String name,
                         @RequestParam("score") float score){
        String json = null;
        try {
            ObjectMapper mapper = new ObjectMapper(); //json转换器
            json = mapper.writeValueAsString(resolve(request)); //将上传图片转换成json
        } catch (IOException e) {
            return null;
        }
        Catalog catalog = new Catalog();
        catalog.setCourseId(courseId);
        catalog.setParentId(parentId);
        catalog.setIndex(index);
        catalog.setName(name);
        if (catalogService.create(catalog)>0){
            System.out.println(json.length());
            Question question = new Question();
            question.setCatalogId(catalog.getId());
            question.setQuestions(json);
            question.setTotal(score);
            if (questionService.create(question)>0){
                return "success";
            } else {
                catalogService.delete(catalog.getId());
                return null;
            }
        } else {
            return null;
        }
    }

}
