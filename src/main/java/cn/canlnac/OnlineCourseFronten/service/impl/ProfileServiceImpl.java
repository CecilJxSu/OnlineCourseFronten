package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.ProfileDao;
import cn.canlnac.OnlineCourseFronten.entity.Profile;
import cn.canlnac.OnlineCourseFronten.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户资料数据事务实现
 */
@Transactional
@Component(value = "ProfileService")
public class ProfileServiceImpl implements ProfileService {
    @Autowired
    private ProfileDao profileDao;

    /**
     * 创建用户资料
     * @param profile   用户资料
     * @return          用户资料ID
     */
    public int create(Profile profile) {
        return profileDao.create(profile);
    }

    /**
     * 更新用户资料
     * @param profile   用户资料
     * @return          更新数目
     */
    public int update(Profile profile) {
        return profileDao.update(profile);
    }

    /**
     * 根据用户ID获取用户资料
     * @param userID    用户ID
     * @return          用户资料
     */
    public Profile findByUserID(int userID) {
        return profileDao.findByUserID(userID);
    }
}
