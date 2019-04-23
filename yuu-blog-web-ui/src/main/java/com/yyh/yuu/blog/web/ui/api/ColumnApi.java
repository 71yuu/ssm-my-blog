package com.yyh.yuu.blog.web.ui.api;

import com.yyh.yuu.blog.commons.utils.HttpClientUtils;
import com.yyh.yuu.blog.commons.utils.MapperUtils;
import com.yyh.yuu.blog.domain.Column;

import java.util.List;

/**
 * @Classname ColumnApi
 * @Date 2018/11/17 17:31
 * @Created by Yuu
 */
public class ColumnApi {

    public static List<Column> getColumnList() {
        List<Column> columnList = null;
        String result = HttpClientUtils.doGet(API.API_COLUMN);
        try {
            columnList = MapperUtils.json2listByTree(result, "data", Column.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return columnList;
    }
}
