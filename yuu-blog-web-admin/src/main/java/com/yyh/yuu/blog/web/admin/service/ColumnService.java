package com.yyh.yuu.blog.web.admin.service;

import com.yyh.yuu.blog.domain.Column;

import java.util.List;

/**
 * @Classname ColumnService
 * @Date 2018/11/15 11:15
 * @Created by Yuu
 */
public interface ColumnService {

    void save(Column column);

    List<Column> getAll();

    Column getById(Integer id);

    void deleteById(Integer id);
}
