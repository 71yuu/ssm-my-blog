package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.commons.dto.PageInfo;
import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.web.admin.dao.ArticleDao;
import com.yyh.yuu.blog.web.admin.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Classname ArticleServiceImpl
 * @Date 2018/11/16 12:45
 * @Created by Yuu
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public void save(Article article) {
        if (article.getId() == null) {
            articleDao.save(article);
        } else {
            articleDao.update(article);
        }
    }

    @Override
    public List<Article> getAll() {
        return articleDao.getAll();
    }

    @Override
    public Article getById(Integer id) {
        return articleDao.getById(id);
    }

    @Override
    public void delete(String id) {
        articleDao.delete(id);
    }

    @Override
    public List<Article> search(String cid, String key) {
        if ("0".equals(cid)) {
            cid = null;
        }
        return articleDao.search(cid,key);
    }

    @Override
    public List<Article> getNew() {
        return articleDao.getNew();
    }

    @Override
    public PageInfo<Article> page(Map<String, Object> params) {
        PageInfo<Article> pageInfo = new PageInfo<>();

        int count = articleDao.getArticleNum();
        List<Article> articles = articleDao.page(params);

        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(articles);
        return pageInfo;
    }


}
