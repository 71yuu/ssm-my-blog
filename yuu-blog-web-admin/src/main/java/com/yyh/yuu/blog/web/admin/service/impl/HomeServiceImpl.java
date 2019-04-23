package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.web.admin.dao.ArticleDao;
import com.yyh.yuu.blog.web.admin.dao.ColumnDao;
import com.yyh.yuu.blog.web.admin.dto.Home;
import com.yyh.yuu.blog.web.admin.service.ArticleService;
import com.yyh.yuu.blog.web.admin.service.ColumnService;
import com.yyh.yuu.blog.web.admin.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Classname HomeServiceImpl
 * @Date 2018/11/13 19:23
 * @Created by Yuu
 */
@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private ColumnDao columnDao;

    @Override
    public Home getHome() {
        Home home = new Home();
        home.setArticleNum(articleDao.getArticleNum());
        home.setArticleClick(articleDao.getClickNum());
        home.setColumnNum(columnDao.getColumnNum());
        return home;
    }

}
