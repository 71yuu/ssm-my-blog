package com.yyh.yuu.blog.web.admin.dao;

import com.yyh.yuu.blog.domain.Manager;
import org.springframework.stereotype.Repository;

/**
 * @Classname ManagerDao
 * @Date 2018/11/13 14:00
 * @Created by Yuu
 */
@Repository
public interface ManagerDao {

    Manager getByUsername(String username);
}
