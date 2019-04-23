package com.yyh.yuu.blog.web.ui.controller;

import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.web.ui.api.ArticleAPI;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Classname ArticleController
 * @Date 2018/11/19 23:50
 * @Created by Yuu
 */
@Controller
@RequestMapping("article")
public class ArticleController {

    @RequestMapping(value = "{aname}", method = RequestMethod.GET)
    public String article(@PathVariable("aname") String aname, Model model) {
        // 请求文章
        requestArticle(aname, model);
        return "article";
    }

    private void requestArticle(String aname, Model model) {
        Article article = ArticleAPI.getArticle(aname);
        model.addAttribute("article", article);
    }
}
