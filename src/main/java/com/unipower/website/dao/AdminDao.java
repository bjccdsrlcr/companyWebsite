package com.unipower.website.dao;

import com.unipower.website.entity.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 */
public interface AdminDao {

    /**
     * 用过用户名和密码验证是否存在用户
     * @param username
     * @param password
     * @return
     */
    public Admin verifyAdmin(@Param("username") String username, @Param("password") String password);

    /**
     * 查找是否有该用户名的用户
     * @param username
     * @return
     */
    public Admin findAdminByName(@Param("username") String username);

    /**
     * 根据用户名的id查找用户
     * @param fid
     * @return
     */
    public Admin findAdminById(@Param("fid") int fid);

    /**
     * 根据用户名的id查找用户的用户名
     * @param fid
     * @return
     */
    public String findAdminNameById(@Param("fid") int fid);
}
