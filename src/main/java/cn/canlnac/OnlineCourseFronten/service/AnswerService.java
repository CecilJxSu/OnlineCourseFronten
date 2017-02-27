package cn.canlnac.OnlineCourseFronten.service;

import cn.canlnac.OnlineCourseFronten.entity.Answer;

import java.util.List;

/**
 * 回答事务接口
 */
public interface AnswerService {
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
     * 因为与移动端逻辑同步，注释测方法，改用B
     * 获取回答
     * @param questonId 小测ID
     * @param userId    用户ID
     * @return          回答
     */
//    Answer getAnswer(
//            int catalogId,
//            int userId
//    );
    Answer getAnswer(
            int questonId,
            int userId
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
            int start,
            int count,
            int userId
    );

    /**
     * 获取某测试的回答
     * @param start     分页开始位置
     * @param count     分页返回数目
     * @param testId    测试id
     * @return
     */
    List<Answer> getAnswersByTestId(
            int start,
            int count,
            int testId
    );

    /**
     * 获取某测试的回答总条数
     * @param testId    测试id
     * @return
     */
    int getCountByTestId(
            int testId
    );
}
