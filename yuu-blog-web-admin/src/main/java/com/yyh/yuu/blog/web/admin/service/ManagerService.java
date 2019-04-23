package com.yyh.yuu.blog.web.admin.service;

import com.yyh.yuu.blog.domain.Manager;

/**
 * @Classname ManagerService
 * @Date 2018/11/13 17:09
 * @Created by Yuu
 */
public interface ManagerService {

    Manager login(String username, String password);
}
