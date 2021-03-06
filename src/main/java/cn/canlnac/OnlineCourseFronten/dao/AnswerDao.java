package cn.canlnac.OnlineCourseFronten.dao;

import cn.canlnac.OnlineCourseFronten.entity.Answer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 回答接口
 */
@Component
public interface AnswerDao {
    /**
     * 创建回答
     * @param answer    回答
     * @return          成功创建数目
     */
    int create(Answer answer);

    /**
     * 更新回答
     * @param answer    回答
     * @return          成功更新数目
     */
    int update(Answer answer);

    /**
     * 获取回答
     * @param questionId 小测ID
     * @param userId    用户ID
     * @return          回答
     */
    Answer getAnswer(
            @Param("questionId") int questionId,
            @Param("userId") int userId
    );

    /**
     * 统计用户的回答数
     * @param userId    用户ID
     * @return          回答数
     */
    int count(int userId);

    /**
     * 获取用户回答
     * @param start     分页开始位置
     * @param count     分页返回数目
     * @param userId    用户ID
     * @return
     */
    List<Answer> getAnswers(
            @Param("start") int start,
            @Param("count") int count,
            @Param("userId") int userId
    );

    /**
     * 获取某测试的回答
     * @param start         分页开始位置
     * @param count         分页返回数目
     * @param questionId    测试id
     * @return
     */
    List<Answer> getAnswersByQuestionId(
            @Param("start") int start,
            @Param("count") int count,
            @Param("questionId") int questionId
    );

    /**
     * 获取某测试的回答总条数
     * @param questionId    测试id
     * @return
     */
    int getCountByQuestionId(
            @Param("questionId") int questionId
    );
}