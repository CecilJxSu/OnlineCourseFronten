package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.DocumentDao;
import cn.canlnac.OnlineCourseFronten.entity.Document;
import cn.canlnac.OnlineCourseFronten.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文档事务接口实现
 */
@Transactional
@Component(value = "DocumentService")
public class DocumentServiceImpl implements DocumentService {
    @Autowired
    private DocumentDao documentDao;

    /**
     * 创建文档
     * @param document  文档
     * @return          创建成功数目
     */
    public int create(Document document) {
        return documentDao.create(document);
    }

    /**
     * 根据ID获取文档
     * @param id    文档ID
     * @return      文档
     */
    public Document findByID(int id) {
        return documentDao.findByID(id);
    }

    /**
     * 根据文件url获取文档
     * @param url       文件url
     * @return
     */
    public List<Document> findByUrl(String url){
        return documentDao.findByUrl(url);
    }

    /**
     * 统计文档数目
     * @param targetType    目标类型，课程：course；章节：catalog
     * @param targetId      目标ID
     * @param type          文件类型,全部：null;视频：video；图片：img；其他：other
     * @return              文档数目
     */
    public int count(String targetType, int targetId,String type) {
        return documentDao.count(targetType, targetId,type);
    }

    /**
     * 获取指定类型和目标下的文档
     * @param start         分页开始位置
     * @param count         分页返回数目
     * @param sort          排序：按日期排序：date，按名称：name，按大小：size
     * @param targetType    目标类型，课程：course；章节：catalog
     * @param targetId      目标ID
     * @param type          文件类型,全部：null;视频：video；图片：img；其他：other
     * @return              文档列表
     */
    public List<Document> getDocuments(
            int start,
            int count,
            String sort,
            String targetType,
            int targetId,
            String type
    ) {
        return documentDao.getDocuments(start, count, sort, targetType, targetId,type);
    }

    /**
     * 删除文档
     * @param id    文档ID
     * @return      删除成功数目
     */
    public int delete(int id) {
        return documentDao.delete(id);
    }
}