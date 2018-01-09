package com.unipower.website.web;

import com.unipower.website.entity.*;
import com.unipower.website.service.AdminService;
import com.unipower.website.service.CommentService;
import com.unipower.website.service.NewsService;
import com.unipower.website.service.NewsTypeService;
import com.unipower.website.util.DateUtil;
import com.unipower.website.util.GetIDs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/2.
 */
@Controller
@RequestMapping(value = "/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private AdminService adminService;
    //添加评论信息
    @RequestMapping(value = "/addComments")
    @ResponseBody
    private Map<String, String> commentsData(HttpServletRequest request, HttpSession session) throws ParseException {
        String text  = request.getParameter("text");
        // 判断一下当前用户的身份， 用session , 暂时默认为匿名用户
        System.out.println(session.getAttribute("pri_id") + "username: "+ session.getAttribute("username"));
        Object user_id = session.getAttribute("userId");
        // 当session为空时，为未登录状态，将user_id设置为2 是因为数据库设置了当id为2时为普通用户
        if (user_id == null) {
            user_id = 2;
        }
        String path = request.getRequestURI();
        //int news_id = GetIDs.getIDsFromPath(path);
        int news_id = Integer.parseInt(request.getParameter("fid"));
        Date date = DateUtil.getFormatDate(new Date());
        commentService.addComment(date, text, (Integer) user_id, news_id);
        Map<String, String> result = new HashMap<String, String>();
        result.put("result", "success");
        return result;
    }

    @RequestMapping(value = "/commentList")
    private String commentList(Model model){
        return "commentList";
    }

    @RequestMapping(value = "/commentListData")
    @ResponseBody
    private Map commentListData(){
        List<Comments> list = commentService.getAllCommentsList();
        Map result = new HashMap();
        for (int i = 0; i < list.size(); i++){
            News news = newsService.getNewsById(list.get(i).getNews_id());
            // 用户名有可能为空的
            //不要传用户信息到前端，这里只传用户id和用户名
            try{
                Admin admin = adminService.findAdminById(list.get(i).getUser_id());
                String userName = admin.getUser_name();
                list.get(i).setUser_name(userName);
            }catch (Exception e){
                System.out.println("用户名当前为空值需要处理");
            }
            list.get(i).setNews(news);
        }
        result.put("code", 200);
        result.put("data", list);

        return result;
    }
    @RequestMapping(value = "/deleteComment")
    @ResponseBody
    private Map deleteComment(HttpServletRequest request){
        int fid = Integer.parseInt(request.getParameter("fid"));
        commentService.deleteComment(fid);
        Map result = new HashMap();
        result.put("result", "Success");
        result.put("message", "you have delete a record successfully!");
        result.put("commentId", fid);
        result.put("code", 200);
        return result;
    }
}
