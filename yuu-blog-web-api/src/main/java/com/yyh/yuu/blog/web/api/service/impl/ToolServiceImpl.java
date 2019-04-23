package com.yyh.yuu.blog.web.api.service.impl;

import com.yyh.yuu.blog.domain.Tool;
import com.yyh.yuu.blog.web.api.dao.ToolDao;
import com.yyh.yuu.blog.web.api.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname ToolServiceImpl
 * @Date 2018/11/17 15:28
 * @Created by Yuu
 */
@Service
public class ToolServiceImpl implements ToolService {

    @Autowired
    private ToolDao toolDao;

    @Override
    public List<Tool> getParent() {
        return toolDao.getParent();
    }

    @Override
    public List<Tool> getItem() {
        return toolDao.getItem();
    }
}
