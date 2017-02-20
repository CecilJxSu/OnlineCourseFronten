package cn.canlnac.OnlineCourseFronten.dao;

import cn.canlnac.OnlineCourseFronten.entity.Question;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 章节的小测数据接口
 */
@Component
public interface QuestionDao {
    /**
     * 创建问题
     * @param question  问题
     * @return          创建成功数目
     */
    int create(Question question);

    /**
     * 根据ID获取问题
     * @param id    问题ID
     * @return      问题
     */
    Question findById(int id);

    /**
     * 因为与移动端逻辑同步，注释测方法，改用B
     * 根据章节ID获取问题
     * @param catalogId 章节ID
     * @return          问题
     */
    //Question findByCatalogId(int catalogId);
    List<Question> findByCatalogId(int catalogId);

    /**
     * 更新问题
     * @param question  问题
     * @return          更新成功数目
     */
    int update(Question question);

    /**
     * 删除小测
     * @param id    问题ID
     * @return      删除成功数目
     */
    int delete(int id);
}