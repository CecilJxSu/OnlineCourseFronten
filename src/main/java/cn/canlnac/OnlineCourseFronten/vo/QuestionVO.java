package cn.canlnac.OnlineCourseFronten.vo;

import java.util.List;
import java.util.Map;

/**
 * 试题单元，即一道题
 * Created by can on 2017/2/12.
 */
public class QuestionVO {
    public Map item;
    public String question;
    public List<String> answer;
    public String type;
    public String explains;

    public Map getItem() {
        return item;
    }

    public void setItem(Map item) {
        this.item = item;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<String> getAnswer() {
        return answer;
    }

    public void setAnswer(List<String> answer) {
        this.answer = answer;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExplains() {
        return explains;
    }

    public void setExplains(String explains) {
        this.explains = explains;
    }
}
