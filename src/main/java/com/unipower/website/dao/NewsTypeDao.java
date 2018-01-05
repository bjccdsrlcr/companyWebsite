package com.unipower.website.dao;

import com.unipower.website.entity.NewsType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 * 新闻类别主要是对新闻进行分类管理，新闻类别指类似于
 * 1.公司动态
 * 2.市场活动
 * 3.媒体报道
 * 一条新闻可能会对应多个新闻类别
 * 一个新闻类别下会有多条新闻
 * 新闻与新闻类别是多对多的关系。
 *
 * 新闻类别的操作接口：
 * 增加新闻类别: void addType(String typeName)
 * 更新新闻类别信息: void updateType(int fid, String typeName)
 * 批量更新类别信息: void updateTypes(List<Integer> fids, List<String> typeNames)
 * 删除类别: void deleteType(int fid)
 */
public interface NewsTypeDao {
    /**
     * 增加新闻类别
     * @param typeName
     */
    public void addType(@Param("typeName") String typeName, @Param("decription") String decription);

    /**
     * 通过id查找新闻类别
     * @param fid
     * @return
     */
    public NewsType getNewsTypeById(int fid);
    /**
     *
     * @return
     */
    public List<NewsType> getNewsTypeList();

    /**
     * 更新新闻类别信息
     * @param fid
     * @param typeName
     */
    public void updateType(@Param("fid")int fid, @Param("typeName") String typeName, @Param("decription")String decription);

    /**
     * 批量更新类别信息
     * @param fids
     * @param typeNames
     */
    public void updateTypes(List<Integer> fids, List<String> typeNames, List<String> decription);

    /**
     * 删除类别
     * @param fid
     */
    public void deleteType(int fid);

    /**
     * 根据新闻ID查询该新闻所属的类别
     * @param newsId
     * @return
     */
    public List<NewsType> getTypesByNews(int newsId);

    /**
     * 根据新闻ID删除其对应的新闻类别
     * @param newsId
     */
    public void deleteTypeByNewsId(int newsId);
    /**
     *
     * @param newsIdList
     * @return
     */
    public List<NewsType> getTypes(List<Integer> newsIdList);
}
