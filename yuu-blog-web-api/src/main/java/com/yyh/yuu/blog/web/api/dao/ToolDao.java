package com.yyh.yuu.blog.web.api.dao;

import com.yyh.yuu.blog.domain.Tool;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Classname ToolDao
 * @Date 2018/11/17 15:30
 * @Created by Yuu
 */
@Repository
public interface ToolDao {

    List<Tool> getParent();

    List<Tool> getItem();
}
