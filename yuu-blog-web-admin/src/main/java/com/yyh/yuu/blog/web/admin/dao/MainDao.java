package com.yyh.yuu.blog.web.admin.dao;

import com.yyh.yuu.blog.domain.Main;

/**
 * @Classname MainDao
 * @Date 2018/11/13 14:00
 * @Created by Yuu
 */
public interface MainDao {

    void insertImg(String targetPath);

    String getImgPath();

    Main getMain();

    Main getMainByName(String name);

    void saveBanner(Main main);
}
