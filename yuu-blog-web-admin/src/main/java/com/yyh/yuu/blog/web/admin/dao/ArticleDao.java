package com.yyh.yuu.blog.web.admin.dao;

import com.yyh.yuu.blog.domain.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Classname ArticleDao
 * @Date 2018/11/13 13:59
 * @Created by Yuu
 */
public interface ArticleDao {

    void save(Article article);

    List<Article> getAll();

    Article getById(Integer id);

    void update(Article article);

    void delete(String id);

    List<Article> search(@Param("cid") String cid, @Param("aname") String aname);

    Integer getArticleNum();

    Integer getClickNum();

    List<Article> getNew();

    List<Article> page(Map<String, Object> params);
}
