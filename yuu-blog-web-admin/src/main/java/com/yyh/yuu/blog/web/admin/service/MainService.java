package com.yyh.yuu.blog.web.admin.service;

import com.yyh.yuu.blog.domain.Main;

/**
 * @Classname MainService
 * @Date 2018/11/14 20:01
 * @Created by Yuu
 */
public interface MainService {

    void uploadImg(String targetPath);

    String getImgPath();

    Main getMain();

    void updateBanner(String name);

    Main getMainByName(String name);

    void saveBanner(Main main);
}
