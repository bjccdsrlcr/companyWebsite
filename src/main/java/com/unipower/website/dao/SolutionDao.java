package com.unipower.website.dao;

import com.unipower.website.entity.Products;
import com.unipower.website.entity.Solutions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
public interface SolutionDao {

    public void addSolution(@Param("sol_name") String sol_name, @Param("intro") String intro);


    public void deleteSolution(int fid);


    public void updateSolution(@Param("sol_name") String sol_name, @Param("intro") String intro, @Param("fid") int fid);


    public List<Solutions> getSolList();


    public Solutions getSolById(int fid);

}
