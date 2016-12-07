package cn.canlnac.OnlineCourseFronten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by can on 2016/12/7.
 */
@Controller
@RequestMapping("login")
public class LoginController {

    @RequestMapping("page")
    public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("");
        return modelAndView;
    }
}
