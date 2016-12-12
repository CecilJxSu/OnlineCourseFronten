package cn.canlnac.OnlineCourseFronten.service.impl;

import cn.canlnac.OnlineCourseFronten.dao.ExampleDao;
import cn.canlnac.OnlineCourseFronten.entity.Example;
import cn.canlnac.OnlineCourseFronten.service.ExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by can on 2016/9/10.
 */
@Transactional
@Component(value = "exampleService")
public class ExampleServiceImpl implements ExampleService {
    @Autowired
    private ExampleDao exampleDao;


    public List<Example> getAll() {
        return exampleDao.selectAll();
    }
}
