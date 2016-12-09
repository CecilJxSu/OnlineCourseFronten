package cn.canlnac.OnlineCourseFronten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("video")
public class VideoController {
    @RequestMapping("showVideo")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/video";
    }
}
