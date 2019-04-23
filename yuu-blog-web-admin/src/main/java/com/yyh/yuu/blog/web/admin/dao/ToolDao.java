package com.yyh.yuu.blog.web.admin.dao;

import com.yyh.yuu.blog.domain.Tool;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Classname ToolDao
 * @Date 2018/11/13 14:01
 * @Created by Yuu
 */
@Repository
public interface ToolDao {
    List<Tool> selectAll();

    Tool getById(Integer id);

    void insert(Tool tool);

    void update(Tool tool);

    void deleteById(String id);

    void deleteByPid(String id);
}
