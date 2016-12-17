package cn.canlnac.OnlineCourseFronten.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by can on 2016/12/17.
 * 文件管理工具类
 */
public class MyFile {

    public static List<Map> saveFlie(HttpServletRequest request) throws NoSuchAlgorithmException, IOException {
        List returnList = new ArrayList();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());

        //检查form中是否有enctype="multipart/form-data"
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
                    //获取原文件名
                    String fileName = file.getOriginalFilename();
                    //获取后文件缀名
                    String suffix = file.getOriginalFilename().split("\\.")[1];

                    //创建新文件名
                    String uuid = UUID.randomUUID().toString();
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    messageDigest.update(uuid.getBytes());
                    uuid = String.format("%032X", new BigInteger(1, messageDigest.digest()));
                    String fileUrl = uuid+"."+suffix;

                    //文件存储路径
                    String path = getProjectPath(request)+"/../sources/"+fileUrl;
                    //上传
                    file.transferTo(new File(path));

                    Map map = new HashMap();
                    map.put("fileType",suffix);
                    map.put("fileSize",file.getSize());
                    map.put("url",fileUrl);
                    map.put("fileName",fileName);
                    returnList.add(map);
                }
            }
        }

        return returnList;
    }

    /**
     * 删除文件
     * @param fileUrl   文件名，不是全路径，例如：default.png
     * @param request
     */
    public static void deleteFile(String fileUrl,HttpServletRequest request){
        File deleteFile = new File(getProjectPath(request)+"/../sources/"+fileUrl);
        if (deleteFile.isFile() && deleteFile.exists()){
            deleteFile.delete();
        }
    }

    /**
     * 得到项目根路径
     * @param request
     * @return
     */
    public static String getProjectPath(HttpServletRequest request){
        return request.getSession().getServletContext().getRealPath("/");
    }
}
