package com.yyh.yuu.blog.web.api.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.web.api.service.ArticleServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname ArticleController
 * @Date 2018/11/19 23:37
 * @Created by Yuu
 */
@Controller
@RequestMapping("${api.path}")
public class ArticleController {

    @Autowired
    private ArticleServie articleServie;

    @RequestMapping(value = "article", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult article(String aname) {
        return BaseResult.success("成功", articleServie.getByName(aname));
    }
}
