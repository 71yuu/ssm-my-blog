package com.yyh.yuu.blog.web.api.service.impl;

import com.yyh.yuu.blog.domain.Main;
import com.yyh.yuu.blog.web.api.dao.MainDao;
import com.yyh.yuu.blog.web.api.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Classname MainServiceImpl
 * @Date 2018/11/17 17:23
 * @Created by Yuu
 */
@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private MainDao mainDao;

    @Override
    public Main getMain() {
        return mainDao.getMain();
    }
}
