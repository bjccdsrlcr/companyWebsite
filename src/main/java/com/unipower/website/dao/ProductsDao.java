package com.unipower.website.dao;

import com.unipower.website.entity.Products;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 * 产品模块的操作接口：
 *
 * 增加产品： void addProduct();
 * 删除产品:  void deleteProduct();
 * 修改产品信息： void updateProduct();
 *
 * 查询产品：
 * 1.获得产品列表 getProList();
 * 2.根据产品的名字查询 getProByName();
 * 3.根据产品的ID查询 getProById();
 * 4.获得产品列表 getProList();-
 *
 * 产品的发布：
 * 初定给产品一个默认的位值(default value = '不发布')， 当管理员选定该产品将要发布该产品时，修改该位值
 * SELECT * FROM products WHERE *** AND value = '发布';
 *
 * 设定产品是否为热门商品或者置顶显示:
 * isHot? isTop
 */
public interface ProductsDao {
    /**
     * 添加产品
     * @param pro_name 产品名称
     * @param intro 产品介绍
     */
    public void addProduct(@Param("pro_name") String pro_name, @Param("intro") String intro);


    /**
     * 根据产品的id删除产品
     * @param fid
     */
    public void deleteProduct(int fid);


    /**
     * 更新产品的信息
     * @param pro_name
     * @param intro
     */
    public void updateProduct(@Param("pro_name") String pro_name, @Param("intro") String intro, @Param("fid") int fid);

    /**
     * 产品是否发布?
     * @param fid
     */
    public void updateProductIsPub(@Param("fid") int fid, @Param("is_pub") boolean is_pub);

    /**
     * 产品是否为热门产品
     * @param fid
     */
    public void updateProductIsHot(@Param("fid") int fid, @Param("is_hot") boolean is_hot);

    /**
     * 获取产品列表
     * @return
     */
    public List<Products> getProList();

    /**
     * 根据产品的id查询产品
     * @param fid
     * @return
     */
    public Products getProById(int fid);

    /**
     * 根据产品的名称查询产品, 模糊搜索
     * @param name
     * @return
     */
    public Products getProByName(String name);
}
