package com.unipower.website.service;

import com.alibaba.fastjson.JSONObject;
import com.unipower.website.entity.Products;
import com.unipower.website.util.DateUtil;
import com.unipower.website.util.StringUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.Properties;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
@Service
public class FileService {
    @Autowired
    private ProductsService productsService;
    /**
     * 上传图片
     * @param file
     * @param params
     * @return
     * @throws Exception
     */
    public String upload(MultipartFile file, JSONObject params) throws Exception{
        //过滤合法的文件类型
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
        String allowSuffixs = "gif,jpg,jpeg,bmp,png,ico";
        if(allowSuffixs.indexOf(suffix) == -1){
            params.put("resultStr", "not support the file type!");
        }

        //获取网络地址、本地地址头部
        Properties config = new Properties();
        config.load(this.getClass().getClassLoader().getResourceAsStream("config.properties"));
        String urlPath = config.getProperty("urlRoot");
        String localPath = config.getProperty("localRoot");

        //创建新目录
        String uri = File.separator + DateUtil.getNowDateStr(File.separator);
        File dir = new File(localPath + uri);
        if(!dir.exists()){
            dir.mkdirs();
        }

        //创建新文件
        String newFileName = StringUtil.getUniqueFileName();
        File f = new File(dir.getPath() + File.separator + newFileName + "." + suffix);

        //将输入流中的数据复制到新文件
        FileUtils.copyInputStreamToFile(file.getInputStream(), f);

        String url = urlPath + uri.replace("\\", "/") + "/" + newFileName + "." + suffix;

        return url;
    }
}
