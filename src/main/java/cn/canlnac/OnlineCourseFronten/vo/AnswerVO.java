package cn.canlnac.OnlineCourseFronten.vo;

import java.util.List;

/**
 * Created by can on 2017/2/13.
 */
public class AnswerVO {
    public String type;
    public double totalScore;
    public List<List<String>> answers;


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(double totalScore) {
        this.totalScore = totalScore;
    }

    public List<List<String>> getAnswers() {
        return answers;
    }

    public void setAnswers(List<List<String>> answers) {
        this.answers = answers;
    }

    @Override
    public String toString() {
        return "{" +
                "type='" + type + '\'' +
                ", totalScore=" + totalScore +
                ", answers=" + answers +
                '}';
    }
}
