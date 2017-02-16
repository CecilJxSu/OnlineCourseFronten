package cn.canlnac.OnlineCourseFronten.controller.test;

import cn.canlnac.OnlineCourseFronten.entity.Answer;
import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.Question;
import cn.canlnac.OnlineCourseFronten.service.AnswerService;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.QuestionService;
import cn.canlnac.OnlineCourseFronten.vo.AnswerVO;
import cn.canlnac.OnlineCourseFronten.vo.QuestionVO;
import cn.canlnac.OnlineCourseFronten.vo.TestUnit;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("test")
public class TestController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private CatalogService catalogService;


    /**
     * 进入小测页面
     * @param id 小测id
     * @return
     */
    @RequestMapping("show")
    public ModelAndView showIndex(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        Question question = questionService.findByCatalogId(id);
        Catalog catalog = catalogService.findByID(id);

        Gson gson=new Gson();
        List<TestUnit> test= new ArrayList<TestUnit>();
        Type Gtype = new TypeToken<ArrayList<TestUnit>>() {}.getType();
        test=gson.fromJson(question.getQuestions(), Gtype);

        modelAndView.addObject("catalog",catalog);
        modelAndView.addObject("test",test);

        Answer answer = answerService.getAnswer(id,userId);
        if (answer!=null){
            List<AnswerVO> answerVOs= new ArrayList<AnswerVO>();
            Type GAtype = new TypeToken<ArrayList<AnswerVO>>() {}.getType();
            answerVOs=gson.fromJson(answer.getAnswer(), GAtype);

            modelAndView.addObject("answer",answer);
            modelAndView.addObject("answerVOs",answerVOs);
        }

        modelAndView.setViewName("/frontend/test");
        return modelAndView;
    }

    @RequestMapping("exam")
    public ModelAndView exam(@RequestParam("id") int catalogId,@RequestParam("answers") String answersStr){
        Gson gson=new Gson();
        Map<String,List<String>> answers = new HashMap<String, List<String>>();
        Type GStype = new TypeToken<HashMap<String, List<String>>>() {}.getType();
        answers=gson.fromJson(answersStr, GStype);

        Question question = questionService.findByCatalogId(catalogId);
        List<TestUnit> test= new ArrayList<TestUnit>();
        Type Gtype = new TypeToken<ArrayList<TestUnit>>() {}.getType();
        test=gson.fromJson(question.getQuestions(), Gtype);

        for (int i=0;i<test.size();i++){
            String type = test.get(i).getType();
            double score = test.get(i).getScore();
            List<QuestionVO> questionVOs = test.get(i).getQuestions();
            int n = 0;
            for (;n<questionVOs.size();n++){
                System.out.println(questionVOs.get(n).answer.toString());
            }
        }
        System.out.println(test);
        System.out.println(answers);



        return showIndex(catalogId);
    }
}
