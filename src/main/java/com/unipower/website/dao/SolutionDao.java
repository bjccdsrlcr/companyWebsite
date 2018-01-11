package com.unipower.website.dao;

import com.unipower.website.entity.Products;
import com.unipower.website.entity.Solutions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
public interface SolutionDao {

    /**
     * 添加解决方案
     * @param sol_name
     * @param intro
     */
    public void addSolution(@Param("sol_name") String sol_name, @Param("intro") String intro);

    /**
     * 删除解决方案
     * @param fid
     */
    public void deleteSolution(int fid);

    /**
     * 更新解决方案
     * @param sol_name
     * @param intro
     * @param fid
     */
    public void updateSolution(@Param("sol_name") String sol_name, @Param("intro") String intro, @Param("fid") int fid);

    /**
     * 得到解决方案列表
     * @return
     */
    public List<Solutions> getSolList();

    /**
     * 根据id查找解决方案
     * @param fid
     * @return
     */
    public Solutions getSolById(int fid);

}
