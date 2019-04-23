package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.domain.Main;
import com.yyh.yuu.blog.web.admin.dao.MainDao;
import com.yyh.yuu.blog.web.admin.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Classname MainServiceImpl
 * @Date 2018/11/14 20:02
 * @Created by Yuu
 */
@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private MainDao mainDao;

    @Override
    public void uploadImg(String targetPath) {
        mainDao.insertImg(targetPath);
    }

    @Override
    public String getImgPath() {
        return mainDao.getImgPath();
    }

    @Override
    public Main getMain() {
        return mainDao.getMain();
    }

    @Override
    public void updateBanner(String name) {
        if ("H1".equals(name)) {
            System.out.printf("H1");
        }
    }

    @Override
    public Main getMainByName(String name) {
        return mainDao.getMainByName(name);
    }

    @Override
    public void saveBanner(Main main) {
        mainDao.saveBanner(main);
    }
}
