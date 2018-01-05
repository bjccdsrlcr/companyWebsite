package com.unipower.website.service;

import com.unipower.website.dao.AdminDao;
import com.unipower.website.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 */
@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;

    public Admin verifyAdmin(String user_name, String password){
        return adminDao.verifyAdmin(user_name, password);
    }

    public Admin findAdminByName(String username){
        return adminDao.findAdminByName(username);
    }

    public Admin findAdminById(int fid){
        return adminDao.findAdminById(fid);
    }
}
