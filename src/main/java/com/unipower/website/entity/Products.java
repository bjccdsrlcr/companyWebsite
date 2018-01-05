package com.unipower.website.entity;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 *  产品的实体类
 *
 *  产品内容可能还会包括图片,以后再加。
 */
public class Products {
    private int fid;
    private String pro_name;
    private String intro;
    private boolean is_hot;
    private boolean is_pub;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public boolean isIs_hot() {
        return is_hot;
    }

    public void setIs_hot(boolean is_hot) {
        this.is_hot = is_hot;
    }

    public boolean isIs_pub() {
        return is_pub;
    }

    public void setIs_pub(boolean is_pub) {
        this.is_pub = is_pub;
    }
}
