package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.AnswerDao;
import cn.canlnac.OnlineCourseFronten.entity.Answer;
import cn.canlnac.OnlineCourseFronten.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 回答事务接口实现
 */
@Transactional
@Component(value = "AnswerService")
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerDao answerDao;

    /**
     * 创建回答
     * @param answer    回答
     * @return          成功创建数目
     */
    public int create(Answer answer) {
        return answerDao.create(answer);
    }

    /**
     * 更新回答
     * @param answer    回答
     * @return          成功更新数目
     */
    public int update(Answer answer) {
        return answerDao.update(answer);
    }

    /**
     * 因为与移动端逻辑同步，注释测方法，改用B
     * 获取回答
     * @param questonId 小测ID
     * @param userId    用户ID
     * @return          回答
     */
//    public Answer getAnswer(
//            int catalogId,
//            int userId
//    ) {
//        return answerDao.getAnswer(catalogId, userId);
//    }
    public Answer getAnswer(
            int questonId,
            int userId
    ) {
        return answerDao.getAnswer(questonId, userId);
    }

    /**
     * 统计用户的回答数
     * @param userId    用户ID
     * @return          回答数
     */
    public int count(int userId) {
        return answerDao.count(userId);
    }

    /**
     * 获取用户回答
     * @param start     分页开始位置
     * @param count     分页返回数目
     * @param userId    用户ID
     * @return
     */
    public List<Answer> getAnswers(
            int start,
            int count,
            int userId
    ) {
        return answerDao.getAnswers(start, count, userId);
    }

    /**
     * 获取某测试的回答
     * @param start     分页开始位置
     * @param count     分页返回数目
     * @param testId    测试id
     * @return
     */
    public List<Answer> getAnswersByTestId(
            int start,
            int count,
            int testId
    ) {
        return answerDao.getAnswersByQuestionId(start, count, testId);
    }

    /**
     * 获取某测试的回答总条数
     * @param testId    测试id
     * @return
     */
    public int getCountByTestId(
            int testId
    ){
        return answerDao.getCountByQuestionId(testId);
    }
}
