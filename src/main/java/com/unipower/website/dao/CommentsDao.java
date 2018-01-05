package com.unipower.website.dao;

import com.unipower.website.entity.Comments;
import org.apache.ibatis.annotations.Param;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 * 评论的操作接口：
 *  1.通过某一条新闻查询该新闻底下的评论， 每一条新闻详情的路由都必须是形如/{newsId}/detail的形式，直接从链接拿到新闻的ID
 *  List<Comments> getCommentsByNewsId(int newsId);
 *  2.增加评论
 *  void  addComments(Date date, Blob text, int user_id, int news_id);
 *  3.删除评论
 *  void deleteComments(int commentsId);
 *  */
public interface CommentsDao {
    /**
     * 通过新闻查询隶属于该新闻的所有评论，排序以时间倒序进行排列
     * 判断当前是否为管理员状态，如果为管理员登录，在显示评论时，可以显示删除评论的按钮
     * @param newsId
     * @return
     */
    public List<Comments> getCommentsByNewsId(int newsId);

    /**
     * 查看所有的评论
     * @return
     */
    public List<Comments> getCommentsList();
    /**
     * 增加评论， 其中评论内容以及新闻ID为必填值
     * 网站后台只有管理员权限，如果user_id为空，则直接显示用户名为匿名，如果user_id有值，则为管理员
     * @param date
     * @param text
     * @param user_id
     * @param news_id
     */
    public void addComments(@Param("date") Date date, @Param("text") String text, @Param("user_id") int user_id, @Param("news_id") int news_id);

    /**
     * 通过评论ID删除特定的评论
     * Q: 评论为一个列表状态，怎么拿到该评论的ID？
     * @param commentsId
     */
    public void deleteComments(int commentsId);
}
