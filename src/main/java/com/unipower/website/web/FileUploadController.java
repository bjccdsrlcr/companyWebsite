package com.unipower.website.web;

import com.alibaba.fastjson.JSONObject;
import com.unipower.website.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
@Controller
public class FileUploadController {
    @Autowired
    private FileService fileService;
    /**
     * 图片文件上传
     */
    @ResponseBody
    @RequestMapping(value = "/photoUpload", method = RequestMethod.POST)
    public String editItemsSubmit(Model model, @RequestParam MultipartFile items_pic, HttpServletRequest request) throws Exception {

        //原始名称
        String originalFilename = items_pic.getOriginalFilename();
        //上传图片
        if (items_pic != null && originalFilename != null && originalFilename.length() > 0) {
            //存储图片的物理路径
            String realPath=request.getSession().getServletContext().getRealPath("/");
            //String pic_path = "E:\\jljdoc\\pic";
            //新的图片名称
            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(realPath + newFileName);
            //将内存中的数据写入磁盘
            items_pic.transferTo(newFile);
        }


//      return "success";
        return "success";
    }
    @RequestMapping(value="/uploadImg", method=RequestMethod.POST)
    @ResponseBody
    public String uploadImg(@RequestParam(value="items_pic")MultipartFile items_pic, HttpServletResponse response){
        JSONObject result = new JSONObject();
        boolean flag = true;
        try {
            fileService.upload(items_pic, result);
        } catch (Exception e) {
            result.put("mess", "调用失败");
            flag = false;
            e.printStackTrace();
        }
        result.put("flag", flag);

        response.setContentType("text/html;charset=UTF-8");
        //解决跨域名访问问题
        response.setHeader("Access-Control-Allow-Origin", "*");

        return result.toString();
    }
    @RequestMapping("/file")
    public String job(Model model){
        return "testfile";
    }
}
