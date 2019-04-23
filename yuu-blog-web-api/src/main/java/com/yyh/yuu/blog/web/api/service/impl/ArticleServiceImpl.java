package com.yyh.yuu.blog.web.api.service.impl;

import com.yyh.yuu.blog.commons.dto.ArticleDto;
import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.api.dao.ArticleDao;
import com.yyh.yuu.blog.web.api.dao.ColumnDao;
import com.yyh.yuu.blog.web.api.service.ArticleServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname ArticleServiceImpl
 * @Date 2018/11/19 9:25
 * @Created by Yuu
 */
@Service
public class ArticleServiceImpl implements ArticleServie {

    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private ColumnDao columnDao;

    @Override
    public Integer getNum(String cname) {
        if (cname != null) {
            cname = cname.replace("-", " ");
        }
        Integer cid = null;
        if (cname != null) {
            cid = columnDao.getByCname(cname);
        }
        return articleDao.getNum(cid);
    }

    @Override
    public List<ArticleDto> list(String cname) {
        if (cname != null) {
            cname = cname.replace("-", " ");
        }
        Integer cid = null;
        if (cname != null) {
            cid = columnDao.getByCname(cname);
        }
        List<Article> articleList = articleDao.list(cid);
        List<ArticleDto> articleDtos = new ArrayList<>();
        for (Article article : articleList) {
            ArticleDto articleDto = new ArticleDto();
            articleDto.setId(article.getId());
            articleDto.setAname(article.getAname());
            articleDto.setAuthor(article.getAuthor());
            articleDto.setCreated(article.getCreated());
            cid = article.getCid();
            Column column = columnDao.getByCid(cid);
            articleDto.setCname(column.getCname());
            articleDtos.add(articleDto);
        }
        return articleDtos;
    }

    @Override
    public Article getByName(String aname) {
        aname = aname.replace("-", " ");
        return articleDao.getByName(aname);
    }
}
