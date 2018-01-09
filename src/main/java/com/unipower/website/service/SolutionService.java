package com.unipower.website.service;

import com.unipower.website.dao.ProductsDao;
import com.unipower.website.dao.SolutionDao;
import com.unipower.website.entity.Products;
import com.unipower.website.entity.Solutions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
@Service
public class SolutionService {
    @Autowired
    private SolutionDao solutionDao;

    public void addSolution(String sol_name, String intro){
        solutionDao.addSolution(sol_name, intro);
    }


    public void deleteSolution(int fid){
        solutionDao.deleteSolution(fid);
    }


    public void updateSolution(String sol_name, String intro, int fid){
        solutionDao.updateSolution(sol_name, intro, fid);
    }


    public List<Solutions> getSolList(){
        return solutionDao.getSolList();
    }


    public Solutions getSolById(int fid){
        return solutionDao.getSolById(fid);
    }

}
