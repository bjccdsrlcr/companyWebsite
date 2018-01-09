package com.unipower.website.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.unipower.website.entity.Comments;
import com.unipower.website.entity.News;
import com.unipower.website.entity.NewsType;
import com.unipower.website.entity.RNewsNewsType;
import com.unipower.website.service.*;
import com.unipower.website.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by bjccdsrlcr on 2017/12/25.
 */
@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private NewsTypeService newsTypeService;
    @Autowired
    private RNewsNewsTypeService rNewsNewsTypeService;
    // 发布新闻页面
    @RequestMapping(value = "/addNews")
    private String add(Model model){
        return "addNews";
    }

    //添加新闻信息
    @RequestMapping(value = "/addNewsData")
    @ResponseBody
    private Map addnewsData(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String title  = request.getParameter("title");
        String author  = request.getParameter("author");
        Date date = DateUtil.getFormatDate(new Date());
        String text = request.getParameter("text");
        News news = new News();
        news.setAuthor(author);
        news.setDate(date);
        news.setTitle(title);
        news.setText(text);
        newsService.addNews(news);
        System.out.println(news.getFid());
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("newsId", news.getFid());
        result.put("result", "success");
        return result;
    }

    //更新新闻是否发布的信息
    @RequestMapping(value = "/isPub")
    @ResponseBody
    public Map updateNewsIsPub(HttpServletRequest request){
        String id = request.getParameter("newsId");
        int newsID = Integer.parseInt(id);
        newsService.updateNewsIsPub(newsID);
        News news = newsService.getNewsById(newsID);
        System.out.println("after" + news.isIs_pub());
        boolean isPub = news.isIs_pub();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("result", "success");
        result.put("isPub", isPub);
        result.put("newsID", newsID);
        result.put("description", "当isPub为true时，表示当前新闻为已发布状态;当isPub为false时，表示当前新闻为未发布状态");
        return result;
    }

    //更新新闻的基础信息
    @RequestMapping(value = "/updateNewsData")
    @ResponseBody
    public Map updateNewsData(HttpServletRequest request) throws ParseException {
        String fid = request.getParameter("newsId");
        int newsId = Integer.parseInt(fid);
        String title  = request.getParameter("title");
        String author  = request.getParameter("author");
        Date date = DateUtil.getFormatDate(new Date());
        String text = request.getParameter("text");
        newsService.updateNews(newsId, title, date, author, text);
        Map<String, String> result = new HashMap<String, String>();
        result.put("result", "success");
        return result;
    }
    // 获得某一条新闻的详细信息
    @RequestMapping(value = "/getNewsById")
    @ResponseBody
    private Map newsDetailById(HttpServletRequest request){
        News news = newsService.getNewsById(Integer.parseInt(request.getParameter("newsId")));
        System.out.println("newsId:" + request.getParameter("newsId"));
        Map result = new HashMap();
        result.put("author", news.getAuthor());
        result.put("title", news.getTitle());
        result.put("text", news.getText());
        result.put("code", 200);
        return result;
    }
    // 获得某一条新闻的详细信息
    @RequestMapping(value = "/newsId={newsId}/detail")
    private String newsDetail(@PathVariable("newsId") int newsId, Model model, HttpServletRequest request){
        //如果没有传值，进行重定向处理
        if (newsId == 0){
            return "redirect:/news/add";
        }
        News news = newsService.getNewsById(newsId);
        List<Comments> commentsList = commentService.getCommentsList(newsId);
        List<NewsType> newsTypeList = newsTypeService.getTypesByNewsId(newsId);
        for (int i = 0; i < commentsList.size(); i++){
            commentsList.get(i).setUser_name(adminService.findAdminNameById(commentsList.get(i).getUser_id()));
            System.out.println(commentsList.get(i).getUser_name());
        }
        model.addAttribute("newsTypeList", newsTypeList);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("news", news);
        return "article";
    }

    @RequestMapping(value = "/newsPubList")
    private String newsPubList(Model model, HttpSession session){
        List<News> newsPubList = newsService.getPubNews();
        List<NewsType> newsTypeList = newsTypeService.getNewsTypeList();
        String username = (String)session.getAttribute("username");
        System.out.println(username);
        model.addAttribute("newsPubList", newsPubList);
        model.addAttribute("newsTypeList", newsTypeList);
        model.addAttribute("username", username);
        return "news";
    }

    @RequestMapping(value = "/newsAllList")
    private String newsAllList(Model model, HttpSession session){
        List<News> list = newsService.getAllNews();
        String username = (String)session.getAttribute("username");
        model.addAttribute("list", list);
        model.addAttribute("username", username);
        return "newsAllList1";
    }

    @RequestMapping(value = "/newsListData")
    @ResponseBody
    private Map newsListData(){
        List<News> list = newsService.getAllNews();
        for (int i = 0; i < list.size(); i++){
            // 返回前端的ListYou数据但是为什么显示undefined
            List<String> typeNameList = newsTypeService.getTypeNamesByNewsId(list.get(i).getFid());
            List<NewsType> typeList = newsTypeService.getTypesByNewsId(list.get(i).getFid());
            list.get(i).setNewsTypes(typeList);
            list.get(i).setType_name(typeNameList);
        }
        Map result = new HashMap();
        result.put("code", 200);
        result.put("data", list);
        //result.put("typeList", typeList);
        return result;
    }

    @RequestMapping(value = "/getNewsByType")
    @ResponseBody
    private List<News> typeListData(HttpServletRequest request){
        // 要选择已经发布的新闻
        int typeId = Integer.parseInt(request.getParameter("type_id"));
        List<News> list = newsService.getNewsByType(typeId);
        return list;
    }

    @RequestMapping(value = "/deleteNews")
    @ResponseBody
    private Map deleteNews(HttpServletRequest request){
        int newsID = Integer.parseInt(request.getParameter("newsId"));
        //存在依赖，需要先删除外键的数据
        newsTypeService.deleteTypesByNewsId(newsID);
        newsService.deleteNews(newsID);
        Map result = new HashMap();
        result.put("code", 200);
        result.put("result", "success");
        result.put("newsId", "被删除的新闻ID是"+newsID);
        return result;
    }
    @RequestMapping(value = "/addNewsTypeByNewsId")
    @ResponseBody
    private Map addNewsTypeByNewsId(@RequestBody List<JSONObject> typeIdList){
        //System.out.println(newsID);
        System.out.println(typeIdList);
        String strtypeIdList = JSON.toJSONString(typeIdList);
        System.out.println(strtypeIdList);
        List<RNewsNewsType> list = new ArrayList<RNewsNewsType>();
        list = JSONObject.parseArray(strtypeIdList, RNewsNewsType.class);
        //int newsId = Integer.parseInt(typeIdList.get(0).get("newsId").toString());
        rNewsNewsTypeService.addRNewsNewsType(list);
        Map result = new HashMap();
        result.put("code", 200);
        result.put("result", "success");
        return result;
    }

    @RequestMapping(value = "/updateNewsTypeByNewsId")
    @ResponseBody
    private Map updateNewsTypeByNewsId(@RequestBody List<JSONObject> typeIdList){
        //System.out.println(newsID);
        System.out.println(typeIdList);
        String strtypeIdList = JSON.toJSONString(typeIdList);
        System.out.println(strtypeIdList);
        List<RNewsNewsType> list = new ArrayList<RNewsNewsType>();
        list = JSONObject.parseArray(strtypeIdList, RNewsNewsType.class);
        int newsId = list.get(0).getNews_id();
        rNewsNewsTypeService.deleteRBynewsId(newsId);
        rNewsNewsTypeService.addRNewsNewsType(list);
        Map result = new HashMap();
        result.put("code", 200);
        result.put("result", "success");
        return result;
    }

}
