package com.yyh.yuu.blog.web.api.dao;

import com.yyh.yuu.blog.domain.Column;

import java.util.List;

/**
 * @Classname ColumnDao
 * @Date 2018/11/17 17:39
 * @Created by Yuu
 */
public interface ColumnDao {

    List<Column> getColumnList();

    Column getByCid(Integer id);

    Integer getByCname(String cname);
}
