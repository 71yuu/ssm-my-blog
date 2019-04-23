package com.yyh.yuu.blog.web.api.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.web.api.service.ArticleServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname DynamicController
 * @Date 2018/11/19 9:21
 * @Created by Yuu
 */
@Controller
@RequestMapping("${api.path}/dynamic")
public class DynamicController {

    @Autowired
    private ArticleServie articleServie;

    /**
     * 博文数量
     * @return
     */
    @RequestMapping(value = "num", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult num(String cname) {
        return BaseResult.success("成功", articleServie.getNum(cname));
    }

    /**
     * 博文list
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult list(String cname) {
        return BaseResult.success("成功", articleServie.list(cname));
    }

}
