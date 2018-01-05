package com.unipower.website.service;

import com.unipower.website.dao.CommentsDao;
import com.unipower.website.entity.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2017/12/28.
 */
@Service
public class CommentService {

    @Autowired
    private CommentsDao commentsDao;

    public List<Comments> getCommentsList(int newsId){
        return commentsDao.getCommentsByNewsId(newsId);

    }
    public List<Comments> getAllCommentsList(){
        return commentsDao.getCommentsList();
    }
    public void addComment(Date date, String text, int user_id, int news_id){
         commentsDao.addComments(date, text, user_id, news_id);
    }

    public void deleteComment(int commentId){
        commentsDao.deleteComments(commentId);
    }
}
