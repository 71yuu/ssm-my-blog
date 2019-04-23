package com.yyh.yuu.blog.web.admin.dao;

import com.yyh.yuu.blog.domain.Column;

import java.util.List;

/**
 * @Classname ColumnDao
 * @Date 2018/11/13 14:00
 * @Created by Yuu
 */
public interface ColumnDao {

    void save(Column column);

    List<Column> getAll();

    Column getById(Integer id);

    void deleteById(Integer id);

    void update(Column column);

    Integer getColumnNum();
}
