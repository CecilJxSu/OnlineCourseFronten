package cn.canlnac.OnlineCourseFronten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by HaMi on 2016/12/2.
 */
@Controller
@RequestMapping("index")
public class IndexController {

    @RequestMapping("user")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("frontend/index");
        return modelAndView;
    }

    @RequestMapping("teach")
    public ModelAndView showIndexteach() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("frontend/index");
        return modelAndView;
    }

}
