package com.unipower.website.service;

import com.unipower.website.dao.ProductsDao;
import com.unipower.website.entity.News;
import com.unipower.website.entity.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 */
@Service
public class ProductsService {
    @Autowired
    private ProductsDao productsDao;
    /**
     * 添加产品
     * @param pro_name
     * @param intro
     */
    public void addProduct(String pro_name, String intro, String url){
        productsDao.addProduct(pro_name, intro, url);
    }


    public void addFile(String pro_name, String url){
        productsDao.addFile(pro_name, url);
    }

    /**
     * 根据产品的id删除产品
     * @param fid
     */
    public void deleteProduct(int fid){
        productsDao.deleteProduct(fid);
    }


    /**
     * 更新产品的信息
     * @param pro_name
     */
    public void updateProduct(String pro_name, String intro, int fid, String url){
        productsDao.updateProduct(pro_name, intro, fid, url);
    }

    /**
     * 更新产品的发布信息
     * @param fid
     */
    public void updateProductIsPub(int fid){
        Products products = productsDao.getProById(fid);
        boolean key = products.isIs_pub();
        boolean isPub;
        if (key){
            isPub = false;
        }else {
            isPub = true;
        }
        productsDao.updateProductIsPub(fid, isPub);
    }

    /**
     * 更新产品是否为热门产品
     * @param fid
     */
    public void updateProductIsHot(int fid){
        Products products = productsDao.getProById(fid);
        boolean key = products.isIs_hot();
        boolean isHot;
        if (key){
            isHot = false;
        }else {
            isHot = true;
        }
        productsDao.updateProductIsHot(fid, isHot);
    }

    /**
     * 获取产品列表
     * @return
     */
    public List<Products> getProList(){
        return productsDao.getProList();
    }

    /**
     * 根据产品的id查询产品
     * @param fid
     * @return
     */
    public Products getProById(int fid){
        return productsDao.getProById(fid);
    }

    /**
     * 根据产品的名称查询产品
     * @param name
     * @return
     */
    public Products getProByName(String name){
        return productsDao.getProByName(name);
    }
}
