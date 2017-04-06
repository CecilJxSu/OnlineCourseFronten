package cn.canlnac.OnlineCourseFronten.service;

import cn.canlnac.OnlineCourseFronten.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.assertEquals;

/**
 * Created by can on 2016/12/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/applicationContext-*.xml"})
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void findByUsernameTest(){
        String userName = "lisi1";
        User user = userService.findByUsername(userName);

        assertEquals("123456", user.getPassword());
    }
}
