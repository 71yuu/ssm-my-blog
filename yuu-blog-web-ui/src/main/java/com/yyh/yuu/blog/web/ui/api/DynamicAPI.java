package com.yyh.yuu.blog.web.ui.api;

import com.yyh.yuu.blog.commons.dto.ArticleDto;
import com.yyh.yuu.blog.commons.utils.HttpClientUtils;
import com.yyh.yuu.blog.commons.utils.MapperUtils;
import com.yyh.yuu.blog.domain.Article;

import java.util.List;

/**
 * 博客动态接口
 * @Classname DynamicAPI
 * @Date 2018/11/19 9:14
 * @Created by Yuu
 */
public class DynamicAPI {

    public static Integer num(String cname) {
        Integer num = null;
        String url = API.API_DYNAMIC_NUM + "?cname=" + cname;
        url = url.replaceAll(" ", "-");
        String result = HttpClientUtils.doGet(url);
        try {
            num = MapperUtils.json2pojoByTree(result, "data", Integer.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    public static List<ArticleDto> list(String cname) {
        List<ArticleDto> articleList = null;
        String url = API.API_DYNAMIC_LIST + "?cname=" + cname;
        url = url.replaceAll(" ", "-");
        String result = HttpClientUtils.doGet(url);
        try {
            articleList = MapperUtils.json2listByTree(result, "data", ArticleDto.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return articleList;
    }


}
