package com.yyh.yuu.blog.web.admin.service;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.domain.Tool;

import java.util.List;

/**
 * @Classname ToolService
 * @Date 2018/11/13 21:57
 * @Created by Yuu
 */
public interface ToolService {

    List<Tool> selectAll();

    Tool getById(Integer id);

    BaseResult save(Tool tool);

    void delete(String id);
}
