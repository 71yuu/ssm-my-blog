package com.yyh.yuu.blog.web.api.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.api.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Classname ColumnController
 * @Date 2018/11/17 17:35
 * @Created by Yuu
 */
@Controller
@RequestMapping(value = "${api.path}")
public class ColumnController {

    @Autowired
    private ColumnService columnService;

    @RequestMapping(value = "column", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult getColumnList() {
        List<Column> columnList = columnService.getColumnList();
        return BaseResult.success("成功", columnList);
    }
}
