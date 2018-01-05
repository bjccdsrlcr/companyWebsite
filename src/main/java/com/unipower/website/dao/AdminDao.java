package com.unipower.website.dao;

import com.unipower.website.entity.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 */
public interface AdminDao {

    public Admin verifyAdmin(@Param("username") String username, @Param("password") String password);

    public Admin findAdminByName(@Param("username") String username);

    public Admin findAdminById(@Param("fid") int fid);

}
