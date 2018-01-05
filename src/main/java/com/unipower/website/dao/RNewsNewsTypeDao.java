package com.unipower.website.dao;

import com.unipower.website.entity.RNewsNewsType;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/4.
 */

public interface RNewsNewsTypeDao {
    /**
     * 增加新闻和新闻类别的关系.
     */
    public void addRNewsNewsType(List<RNewsNewsType> rNewsNewsType);

    /**
     * 根据新闻ID删除所有与该新闻ID相关的数据
     * @param news_id
     */
    public void deleteRByNewsId(int news_id);
}
