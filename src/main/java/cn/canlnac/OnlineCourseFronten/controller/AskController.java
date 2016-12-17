package cn.canlnac.OnlineCourseFronten.controller;

import cn.canlnac.OnlineCourseFronten.util.MyFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by HaMi on 2016/12/8.
 */
@Controller
@RequestMapping("ask")
public class AskController {
    @RequestMapping("show")
    public String showIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
        return "/frontend/ask";
    }

    @RequestMapping("upload")
    public void upload( HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
        System.out.println(MyFile.saveFlie(request).toString() );
        //检查form中是否有enctype="multipart/form-data"
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        /*CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());

        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator<String> iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if(file!=null && file.getSize()>0)
                {
                    //获取后文件缀名
                    System.out.println(file.getOriginalFilename());



                }
            }
        }*/
    }
}
