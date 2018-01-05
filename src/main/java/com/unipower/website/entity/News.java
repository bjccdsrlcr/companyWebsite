package com.unipower.website.entity;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/25.
 *
 * 新闻、动态的实体类
 */
public class News {
    private int fid;
    private String title;
    private String author;
    private Date date;
    private String text;
    private boolean is_pub;
    private List<String> type_name;
    private List<NewsType> newsTypes;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    public boolean isIs_pub() {
        return is_pub;
    }

    public void setIs_pub(boolean is_pub) {
        this.is_pub = is_pub;
    }

    public List<String> getType_name() {
        return type_name;
    }

    public void setType_name(List<String> type_name) {
        this.type_name = type_name;
    }

    public List<NewsType> getNewsTypes() {
        return newsTypes;
    }

    public void setNewsTypes(List<NewsType> newsTypes) {
        this.newsTypes = newsTypes;
    }
}
