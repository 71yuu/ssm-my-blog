package com.yyh.yuu.blog.web.api.service;

import com.yyh.yuu.blog.domain.Tool;

import java.util.List;

/**
 * @Classname ToolService
 * @Date 2018/11/17 15:27
 * @Created by Yuu
 */
public interface ToolService {

    List<Tool> getParent();

    List<Tool> getItem();
}
