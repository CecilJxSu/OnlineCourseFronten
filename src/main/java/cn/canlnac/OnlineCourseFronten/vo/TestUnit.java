package cn.canlnac.OnlineCourseFronten.vo;

import java.util.List;

/**
 * 试卷单元模块，如：单选题模块
 * Created by can on 2017/2/12.
 */
public class TestUnit {
    public String type;
    public double score;
    public List<QuestionVO> questions;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public List<QuestionVO> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionVO> questions) {
        this.questions = questions;
    }
}
