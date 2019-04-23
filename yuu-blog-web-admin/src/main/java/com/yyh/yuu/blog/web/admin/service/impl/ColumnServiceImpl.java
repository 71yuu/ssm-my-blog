package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.admin.dao.ColumnDao;
import com.yyh.yuu.blog.web.admin.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname ColumnServiceImpl
 * @Date 2018/11/15 11:15
 * @Created by Yuu
 */
@Service
public class ColumnServiceImpl implements ColumnService {

    @Autowired
    private ColumnDao columnDao;

    @Override
    public void save(Column column) {
        // 编辑
        if (column.getId() != null) {
            columnDao.update(column);
        }

        // 保存
        else {
            columnDao.save(column);
        }
    }

    @Override
    public List<Column> getAll() {
        return columnDao.getAll();
    }

    @Override
    public Column getById(Integer id) {
        return columnDao.getById(id);
    }

    @Override
    public void deleteById(Integer id) {
        columnDao.deleteById(id);
    }
}
