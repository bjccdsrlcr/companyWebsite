package com.unipower.website.service;
import com.unipower.website.dao.NewsDao;
import com.unipower.website.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Blob;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/25.
 */
@Service
public class NewsService{
    @Autowired
    private NewsDao newsDao;

    
    public void addNews(News news) {
        newsDao.addNews(news);
    }

    public News getNewsById(int id){
        return newsDao.getNewsById(id);
    }

    public List<News> getPubNews(){
        return newsDao.getNews();
    }

    public List<News> getAllNews(){
        return newsDao.getAllNews();
    }
    
    public List<News> getNewsByType(int typeId){
        return newsDao.getNewsByType(typeId);
    }
    public void deleteNews(int id){
        newsDao.deleteNews(id);
    }

    public void updateNews(int fid, String title, Date date, String text, String author){
        newsDao.updateNews(fid, title, author, date, text);
    }

    public void updateNewsIsPub(int fid){
        News news = newsDao.getNewsById(fid);
        boolean key = news.isIs_pub();
        boolean isPub;
        if (key){
            isPub = false;
        }else {
            isPub = true;
        }
        newsDao.updateNewsIsPub(fid, isPub);
    }
}
