package com.yyh.yuu.blog.web.ui.controller;

import com.yyh.yuu.blog.commons.dto.ArticleDto;
import com.yyh.yuu.blog.web.ui.api.DynamicAPI;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @Classname ColumnController
 * @Date 2018/11/19 20:24
 * @Created by Yuu
 */
@Controller
@RequestMapping(value = "column")
public class ColumnController {

    @RequestMapping(value = "{cname}", method = RequestMethod.GET)
    public String column(@PathVariable String cname, Model model) {
        // 请求分栏文章数
        requestArticleNum(cname, model);

        // 请求文章列表
        requestArticle(cname, model);

        // 分栏名称
        model.addAttribute("cname", cname);
        return "column";
    }

    /**
     * 分栏文章
     * @param cname
     */
    private void requestArticle(String cname, Model model) {
        List<ArticleDto> articleList = DynamicAPI.list(cname);
        model.addAttribute("articleList", articleList);
    }

    /**
     * 所有分栏文章数
     * @param cname
     */
    private void requestArticleNum(String cname, Model model) {
        Integer articleNum = DynamicAPI.num(cname);
        model.addAttribute("articleNum", articleNum);
    }
}
