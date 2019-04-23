package com.yyh.yuu.blog.web.ui.api;

import com.yyh.yuu.blog.commons.utils.HttpClientUtils;
import com.yyh.yuu.blog.commons.utils.MapperUtils;
import com.yyh.yuu.blog.domain.Main;

/**
 * @Classname MainApi
 * @Date 2018/11/17 17:09
 * @Created by Yuu
 */
public class MainApi {

    public static Main getMain() {
        Main main = null;
        String result = HttpClientUtils.doGet(API.API_MAIN);
        try {
            main = MapperUtils.json2pojoByTree(result, "data", Main.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return main;
    }
}
