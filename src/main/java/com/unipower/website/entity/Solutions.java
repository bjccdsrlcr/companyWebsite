package com.unipower.website.entity;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 * 解决方案的实体类
 */
public class Solutions {
    private int fid;
    private String sol_name;
    private String intro;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getSol_name() {
        return sol_name;
    }

    public void setSol_name(String sol_name) {
        this.sol_name = sol_name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}
