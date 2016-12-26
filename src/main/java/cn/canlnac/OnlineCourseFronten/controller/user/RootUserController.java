package cn.canlnac.OnlineCourseFronten.controller.user;

import cn.canlnac.OnlineCourseFronten.entity.User;
import cn.canlnac.OnlineCourseFronten.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/user")
public class RootUserController {

    @Autowired
    UserService userService;


    /**
     * 进入用户管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/usermanage";
    }

    /**
     * 获取用户数据
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/get")
    @ResponseBody
    public Map getUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String nowPage = request.getParameter("nowPage");//当前页数
        String userstatus = request.getParameter("userstatus");//用户角色
        String username = request.getParameter("username");//用户账号

        //每页显示10条
        int count = 10;
        //分页开始位置
        int start = (Integer.parseInt(nowPage)-1)*count;

        //条件
        Map conditions = new HashMap();
        if (userstatus!=null && userstatus!=""){
            List li = new ArrayList();
            li.add(userstatus.trim());
            conditions.put("userStatus",li);
        }
        if (username!=null && username!=""){
            List li = new ArrayList();
            li.add(username.trim());
            conditions.put("username",li);
        }

        //获取数据
        List users = new ArrayList();
        List<User> list = userService.getList(start,count,conditions);
        for (User user:list){
            Map unit = new HashMap();
            unit.put("id",user.getId());
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            unit.put("date",sf.format(user.getDate()));
            unit.put("status",user.getStatus());
            unit.put("userStatus",user.getUserStatus());
            unit.put("lockDate",user.getLockDate());
            unit.put("lockEndDate",user.getLockEndDate());
            unit.put("username",user.getUsername());
            unit.put("password",user.getPassword());
            users.add(unit);
        }

        //获取总条数
        int totalNum = userService.count(conditions);
        //计算总页数
        int totalPage = totalNum%count==0?totalNum/count:totalNum/count+1;

        Map map = new HashMap();
        map.put("users",users);
        map.put("totalPage",totalPage);

        return map;

    }

    /**
     * 修改用户
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/modify")
    public String modify(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        String userId = request.getParameter("userId");//修改用户Id
        String userStatus = request.getParameter("userStatus");//用户角色
        String status = request.getParameter("status");//用户状态
        String locktime = request.getParameter("locktime");//获取封号时间

        User user = new User();

        if(locktime!=""&& locktime!=null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            user.setLockEndDate(df.parse(locktime));
            user.setLockDate(new Date());
        }

        user.setId(Integer.parseInt(userId));
        user.setUserStatus(userStatus);
        user.setStatus(status);

        int update = userService.update(user);

        if(update==0){
            model.put("update","updatefail");
        }
        if(update>0){
            model.put("update","updatesuccess");
        }

        return "/backend/usermanage" ;
    }

}
