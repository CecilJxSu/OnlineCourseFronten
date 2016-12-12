package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.CatalogDao;
import cn.canlnac.OnlineCourseFronten.entity.Catalog;
import cn.canlnac.OnlineCourseFronten.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 课程章节事务接口实现
 */
@Transactional
@Component(value = "CatalogService")
public class CatalogServiceImpl implements CatalogService {
    @Autowired
    private CatalogDao catalogDao;

    /**
     * 创建章节
     * @param catalog   章节
     * @return          创建成功数目
     */
    public int create(Catalog catalog) {
        return catalogDao.create(catalog);
    }

    /**
     * 获取指定的章节
     * @param id    章节ID
     * @return
     */
    public Catalog findByID(int id) {
        return catalogDao.findByID(id);
    }

    /**
     * 更新章节
     * @param catalog   章节
     * @return          成功更新数目
     */
    public int update(Catalog catalog) {
        return catalogDao.update(catalog);
    }

    /**
     * 获取课程下的所有章节
     * @param courseId  课程ID
     * @return          章节列表
     */
    public List<Catalog> getList(int courseId) {
        return catalogDao.getList(courseId);
    }

    /**
     * 删除章节
     * @param id    章节ID
     * @return      成功删除数目
     */
    public int delete(int id) {
        return catalogDao.delete(id);
    }
}