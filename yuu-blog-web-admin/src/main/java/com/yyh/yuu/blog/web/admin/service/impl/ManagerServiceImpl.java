package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.domain.Manager;
import com.yyh.yuu.blog.web.admin.dao.ManagerDao;
import com.yyh.yuu.blog.web.admin.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

/**
 * @Classname ManagerServiceImpl
 * @Date 2018/11/13 17:10
 * @Created by Yuu
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;

    @Override
    public Manager login(String username, String password) {
        Manager manager = managerDao.getByUsername(username);
        if (manager != null) {
            // 明文加密密码
            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());

            // 判断加密后的密码和数据库中存放的密码是否匹配
            if (md5Password.equals(manager.getPassword())) {
                return manager;
            }
        }
        return null;
    }
}
