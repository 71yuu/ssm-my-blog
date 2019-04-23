package com.yyh.yuu.blog.web.api.dao;

import com.yyh.yuu.blog.domain.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname ArticleDao
 * @Date 2018/11/19 9:27
 * @Created by Yuu
 */
public interface ArticleDao {

    Integer getNum(@Param(value = "cid") Integer cid);

    List<Article> list(@Param(value = "cid") Integer cid);

    Article getByName(@Param(value = "aname") String aname);
}
