package cn.canlnac.OnlineCourseFronten.controller.document;

import cn.canlnac.OnlineCourseFronten.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by can on 2016/12/22.
 */
@Controller
@RequestMapping("root/document")
public class RootDocumentController {
    @Autowired
    private DocumentService documentService;
}
