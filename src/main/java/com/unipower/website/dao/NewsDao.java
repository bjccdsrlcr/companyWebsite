package com.unipower.website.dao;

import com.unipower.website.entity.News;
import org.apache.ibatis.annotations.Param;
import java.sql.Blob;
import java.util.Date;
import java.util.List;
import java.util.ListResourceBundle;

/**
 * Created by bjccdsrlcr on 2017/12/25.
 *  新闻的操作接口：
 */
public interface NewsDao {

    public void addNews(News news);

    /**
     * 查询得到数据库中的所有已发布的新闻
     * 默认处理，按照时间进行倒序排列 筛选出其中的30条， limit 30;
     * @return
     */
    public List<News> getNews();

    /**
     * 查询得到数据库中的所有新闻
     * @return
     */
    public List<News> getAllNews();
    /**
     * 通过id查询一条新闻，或者是前段触发一个点击事件，将某一条新闻的fid传到控制器，由控制器处理得到该条新闻。
     * @param fid
     * @return
     */
    public News getNewsById(int fid);

    /**
     * 通过新闻的名字搜索新闻 %模糊搜索%
     * @param title
     * @return
     */
    public List<News> getNewsByTitle(String title);

    /**
     * 根据日期搜索新闻
     * @param date
     * @return
     */
    public List<News> getNewsByDate(Date date);

    /**
     * 根据新闻类别查询该新闻类别下的所有新闻
     * 在推荐相关新闻时，也可以使用该方法返回的列表
     * @param typeId
     * @return
     */
    public List<News> getNewsByType(int typeId);

    /**
     * 更新新闻的基础信息
     * @param title
     * @param author
     * @param date
     * @param text
     */
    public void updateNews(@Param("fid") int fid, @Param("title") String title, @Param("author") String author,
                           @Param("date") Date date, @Param("text") String text);

    /**
     * 更改新闻的发布状态
     * @param fid
     */
    public void updateNewsIsPub(@Param("fid") int fid, @Param("is_pub") boolean is_pub);
    /**
     * 删除某一条新闻
     * @param fid
     */
    public void deleteNews(@Param("fid") int fid);

}
