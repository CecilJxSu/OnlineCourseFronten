package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.CommentDao;
import cn.canlnac.OnlineCourseFronten.entity.Comment;
import cn.canlnac.OnlineCourseFronten.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 评论事务接口实现
 */
@Transactional
@Component(value = "CommentService")
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    /**
     * 创建评论
     * @param comment   评论
     * @return          成功创建数目
     */

    public int create(Comment comment) {
        return commentDao.create(comment);
    }

    /**
     * 更新评论
     * @param comment   评论
     * @return          更新数目
     */
    public int update(Comment comment) {
        return commentDao.update(comment);
    }

    /**
     * 获取指定评论
     * @param id    评论ID
     * @return      评论
     */
    public Comment findByID(int id) {
        return commentDao.findByID(id);
    }

    /**
     * 统计评论
     * @param targetType    评论类型，课程：course；话题：comment
     * @param targetId      目标ID
     * @return              评论数目
     */
    public int count(
            String targetType,
            int targetId
    ) {
        return commentDao.count(targetType, targetId);
    }

    /**
     * 获取评论列表
     * @param start         分页开始位置
     * @param count         分页返回数目
     * @param sort          排序：日期date，热度rank
     * @param targetType    评论类型，课程：course；话题：comment
     * @param targetId      目标ID
     * @return              评论列表
     */
    public List<Comment> getList(
            int start,
            int count,
            String sort,
            String targetType,
            int targetId
    ) {
        return commentDao.getList(start, count, sort, targetType, targetId);
    }

    /**
     * 删除评论
     * @param id    评论ID
     * @return      删除成功数目
     */
    public int delete(int id) {
        return commentDao.delete(id);
    }
}