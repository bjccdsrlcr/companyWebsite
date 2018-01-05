package com.unipower.website.entity;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 * 新闻类别的实体类
 */
public class NewsType {
    private int fid;
    private String type_name;
    private String decription;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }
}
