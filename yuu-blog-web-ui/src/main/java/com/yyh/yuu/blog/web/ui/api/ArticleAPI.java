package com.yyh.yuu.blog.web.ui.api;

import com.yyh.yuu.blog.commons.utils.HttpClientUtils;
import com.yyh.yuu.blog.commons.utils.MapperUtils;
import com.yyh.yuu.blog.domain.Article;

/**
 * @Classname ArticleAPI
 * @Date 2018/11/19 23:53
 * @Created by Yuu
 */
public class ArticleAPI {

    public static Article getArticle(String aname) {
        Article article = null;
        aname = aname.replace(" ", "-");
        String url = API.API_ARTICLE + "?aname=" + aname;
        String result = HttpClientUtils.doGet(url);
        try {
            article = MapperUtils.json2pojoByTree(result, "data", Article.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return article;
    }
}
