package com.unipower.website.web;

import com.sun.org.apache.regexp.internal.RE;
import com.unipower.website.entity.News;
import com.unipower.website.entity.NewsType;
import com.unipower.website.service.NewsTypeService;
import com.unipower.website.util.GetIDs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.rmi.MarshalledObject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/2.
 */
@Controller
@RequestMapping(value = "/newsType")
public class NewsTypeController {
    @Autowired
    private NewsTypeService newsTypeService;

    //添加产品信息页面
    @RequestMapping(value = "/addNewsType")
    private String addNewsTypePage(){
        return  "addNewsType";
    }

    @RequestMapping(value = "/addNewsTypeData")
    @ResponseBody
    private Map addNewsTypeData(HttpServletRequest request){
        Map<String, String> result = new HashMap<String, String>();
        String type_name = request.getParameter("type_name");
        String decription = request.getParameter("decription");
        newsTypeService.addNewsType(type_name, decription);
        result.put("result", "Success");
        result.put("message", "you have insert into a record successfully!");
        return result;
    }

    @RequestMapping(value = "/newsTypeList")
    private String newsTypeList(){
        return "newsType";
    }

    @RequestMapping(value = "/newsTypeListData")
    @ResponseBody
    private Map newsTypeListData(){
        Map result = new HashMap();
        List<NewsType> list = newsTypeService.getNewsTypeList();
        result.put("data", list);
        result.put("code", 200);
        return result;
    }

    @RequestMapping(value = "/updateNewsType")
    @ResponseBody
    private Map updateNewsType(HttpServletRequest request){
        String type_id = request.getParameter("type_id");
        int fid = Integer.parseInt(type_id);
        Map<String, String> result = new HashMap<String, String>();
        String type_name = request.getParameter("type_name");
        String decription = request.getParameter("decription");
        newsTypeService.updateNewsType(fid, type_name, decription);
        result.put("result", "Success");
        result.put("message", "you have update a record successfully!");
        return result;
    }

    @RequestMapping(value = "/deleteNewsType")
    @ResponseBody
    private Map deleteNewsType(HttpServletRequest request){
        int fid = Integer.parseInt(request.getParameter("fid"));
        newsTypeService.deleteNewsType(fid);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("result", "Success");
        result.put("message", "you have delete a record successfully!");
        result.put("newsTypeID", fid);
        result.put("code", 200);
        return result;
    }

    @RequestMapping(value = "/getTypeById")
    @ResponseBody
    private Map getTypeById(HttpServletRequest request){
        int fid = Integer.parseInt(request.getParameter("fid"));
        NewsType newsType = newsTypeService.getNewsTypeById(fid);
        Map map = new HashMap();
        String typeName = newsType.getType_name();
        String decription = newsType.getDecription();
        map.put("typeName", typeName);
        map.put("decription", decription);
        map.put("fid", fid);
        map.put("code", 200);
        return map;
    }
    @RequestMapping(value = "/getTypesByNewsId")
    @ResponseBody
    private List<NewsType> getTypesByNewsId(HttpServletRequest request){
        String path = request.getRequestURI();
        int fid = GetIDs.getIDsFromPath(path);
        return newsTypeService.getTypesByNewsId(fid);
    }
}
