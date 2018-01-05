package com.unipower.website.service;

import com.unipower.website.dao.NewsTypeDao;
import com.unipower.website.entity.NewsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 */
@Service
public class NewsTypeService {
    @Autowired
    private NewsTypeDao newsTypeDao;

    public void addNewsType(String type_name, String decription){
        newsTypeDao.addType(type_name, decription);
    }

    public List<NewsType> getNewsTypeList(){
        return newsTypeDao.getNewsTypeList();
    }
    public void updateNewsType(int fid, String type_name, String decription){
        newsTypeDao.updateType(fid, type_name, decription);
    }

    public NewsType getNewsTypeById(int fid){
        return newsTypeDao.getNewsTypeById(fid);
    }
    public void deleteNewsType(int fid){
        newsTypeDao.deleteType(fid);
    }

    //返回新闻类别对象
    public List<NewsType> getTypesByNewsId(int newsId){
        return newsTypeDao.getTypesByNews(newsId);
    }
    //返回新闻类别的名称 String[]
    public List<String> getTypeNamesByNewsId(int newsId){
        List<NewsType> newsTypes = newsTypeDao.getTypesByNews(newsId);
        List<String> typeName = new ArrayList<String>();
        for (int i = 0; i < newsTypes.size(); i++){
            System.out.println(newsTypes.get(i).getType_name());
            typeName.add(newsTypes.get(i).getType_name());
        }
        return typeName;
    }

    public void deleteTypesByNewsId(int newsId){
        newsTypeDao.deleteTypeByNewsId(newsId);
    }

    public List<NewsType> getTypes(List<Integer> newsIdList){
        return newsTypeDao.getTypes(newsIdList);
    }
}
