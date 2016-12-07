package cn.canlnac.OnlineCourseFronten.dao;


import cn.canlnac.OnlineCourseFronten.entity.Example;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ExampleDao {
    Example getByID(int id);
    List<Example> selectAll();
}