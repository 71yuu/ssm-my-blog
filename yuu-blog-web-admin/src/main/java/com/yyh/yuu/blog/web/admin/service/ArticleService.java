package com.yyh.yuu.blog.web.admin.service;

import com.yyh.yuu.blog.commons.dto.PageInfo;
import com.yyh.yuu.blog.domain.Article;

import java.util.List;
import java.util.Map;

/**
 * @Classname ArticleService
 * @Date 2018/11/16 12:44
 * @Created by Yuu
 */
public interface ArticleService {

    void save(Article article);

    List<Article> getAll();

    Article getById(Integer id);

    void delete(String id);

    List<Article> search(String cid, String key);

    List<Article> getNew();

    PageInfo<Article> page(Map<String, Object> params);
}
