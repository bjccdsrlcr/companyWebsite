package com.unipower.website.service;

import com.unipower.website.dao.RNewsNewsTypeDao;
import com.unipower.website.entity.RNewsNewsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bjccdsrlcr on 2018/1/4.
 */
@Service
public class RNewsNewsTypeService {
    @Autowired
    private RNewsNewsTypeDao rNewsNewsTypeDao;
    public void addRNewsNewsType(List<RNewsNewsType> rNewsNewsType){
         rNewsNewsTypeDao.addRNewsNewsType(rNewsNewsType);
    }

    public void deleteRBynewsId(int newsId){
        rNewsNewsTypeDao.deleteRByNewsId(newsId);
    }
}
