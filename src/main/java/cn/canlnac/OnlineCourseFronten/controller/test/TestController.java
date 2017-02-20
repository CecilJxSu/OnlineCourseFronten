package cn.canlnac.OnlineCourseFronten.controller.test;

import cn.canlnac.OnlineCourseFronten.entity.Answer;
import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.entity.LearnRecord;
import cn.canlnac.OnlineCourseFronten.entity.Question;
import cn.canlnac.OnlineCourseFronten.service.AnswerService;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import cn.canlnac.OnlineCourseFronten.service.LearnRecordService;
import cn.canlnac.OnlineCourseFronten.service.QuestionService;
import cn.canlnac.OnlineCourseFronten.vo.AnswerVO;
import cn.canlnac.OnlineCourseFronten.vo.QuestionVO;
import cn.canlnac.OnlineCourseFronten.vo.TestUnit;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("test")
public class TestController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private CatalogService catalogService;
    @Autowired
    private LearnRecordService learnRecordService;

    final Gson gson=new Gson();

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
        modelAndView.addObject("userStatus",session.getAttribute("userStatus").toString());
        Question question = questionService.findById(id);


        List<TestUnit> test= new ArrayList<TestUnit>();
        Type Gtype = new TypeToken<ArrayList<TestUnit>>() {}.getType();
        test=gson.fromJson(question.getQuestions(), Gtype);

        modelAndView.addObject("question",question);
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
    public ModelAndView exam(@RequestParam("id") int questionId,@RequestParam("answers") String answersStr){
        List<AnswerVO> answerVOs = new ArrayList<AnswerVO>();
        Type GStype = new TypeToken<ArrayList<AnswerVO>>(){}.getType();
        answerVOs = gson.fromJson(answersStr, GStype);

        Question question = questionService.findById(questionId);
        List<TestUnit> test= new ArrayList<TestUnit>();
        Type Gtype = new TypeToken<ArrayList<TestUnit>>() {}.getType();
        test=gson.fromJson(question.getQuestions(), Gtype);

        //统计总成绩
        double total = 0;

        for (int i=0;i<test.size();i++){
            String type = test.get(i).getType();
            double score = test.get(i).getScore();
            List<QuestionVO> questionVOs = test.get(i).getQuestions();
            List<List<String>> userAnswer = null;
            for (int m=0;m<answerVOs.size();m++){
                if (answerVOs.get(m).getType().equals(type)) {
                    userAnswer = answerVOs.get(m).getAnswers();
                    int y = 0;
                    int count = 0;
                    for(QuestionVO questionVO:questionVOs){
                        if (questionVO.getAnswer().equals(userAnswer.get(count)))
                            y++;
                        count++;
                    }
                    answerVOs.get(m).setTotalScore(score*y/count);
                    total = total+score*y/count;
                }
            }
        }

        //创建Answer对象，存入数据库
        Answer answer = new Answer();
        answer.setQuestionId(question.getId());
        Session session = SecurityUtils.getSubject().getSession();
        int userId = Integer.parseInt(session.getAttribute("id").toString());
        answer.setUserId(userId);
        String json = null;
        try {
            ObjectMapper mapper = new ObjectMapper(); //json转换器
            json = mapper.writeValueAsString(answerVOs); //将上传图片转换成json
        } catch (IOException e) {
            return null;
        }
        answer.setAnswer(json);
        answer.setTotal((float) total);
        answerService.create(answer);

        return new ModelAndView("redirect:/test/show?id="+questionId);
    }
}
