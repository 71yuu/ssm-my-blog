package com.yyh.yuu.blog.web.api.service;

import com.yyh.yuu.blog.commons.dto.ArticleDto;
import com.yyh.yuu.blog.domain.Article;

import java.util.List;

/**
 * @Classname ArticleServie
 * @Date 2018/11/19 9:24
 * @Created by Yuu
 */
public interface ArticleServie {

    Integer getNum(String cname);

    List<ArticleDto> list(String cname);

    Article getByName(String aname);
}
