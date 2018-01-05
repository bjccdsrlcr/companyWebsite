package com.unipower.website.entity;

import java.sql.Blob;
import java.util.Date;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 * 评论的实体类
 * 评论是依赖于新闻存在的，每一条评论都必须依赖于具体的某一篇新闻。
 * 新闻与评论的关系是一对多
 */
public class Comments {
    private int fid;
    private Date date;
    private String text;
    private int user_id;
    private int news_id;
    private News news;
    private Admin admin;
    private String user_name;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }
}
