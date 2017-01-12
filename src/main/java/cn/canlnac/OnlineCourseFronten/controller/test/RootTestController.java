package cn.canlnac.OnlineCourseFronten.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("root/test")
public class RootTestController {



    /**
     * 进入小测页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/testpreview";
    }

    /**
     * 进入小测管理页面
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("manage/show")
    public String manage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        return "/backend/testmanage";
    }

}
