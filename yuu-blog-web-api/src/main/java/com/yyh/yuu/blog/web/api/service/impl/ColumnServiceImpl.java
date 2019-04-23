package com.yyh.yuu.blog.web.api.service.impl;

import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.api.dao.ColumnDao;
import com.yyh.yuu.blog.web.api.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname ColumnServiceImpl
 * @Date 2018/11/17 17:38
 * @Created by Yuu
 */
@Service
public class ColumnServiceImpl implements ColumnService {

    @Autowired
    private ColumnDao columnDao;

    @Override
    public List<Column> getColumnList() {
        return columnDao.getColumnList();
    }
}
