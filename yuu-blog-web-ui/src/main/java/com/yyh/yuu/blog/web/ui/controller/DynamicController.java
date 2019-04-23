package com.yyh.yuu.blog.web.ui.controller;

import com.yyh.yuu.blog.commons.dto.ArticleDto;
import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.web.ui.api.DynamicAPI;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @Classname DynamicController
 * @Date 2018/11/19 8:39
 * @Created by Yuu
 */
@Controller
@RequestMapping("dynamic")
public class DynamicController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String dynamic(Model model) {
        // 请求总发文章数
        requestArticleNum(model);
        // 请求文章
        requestArticle(model);
        return "dynamic";
    }

    /**
     * 总发博文
     * @param model
     * @return
     */
    private void requestArticleNum(Model model) {
        Integer articleNum = DynamicAPI.num(null);
        model.addAttribute("articleNum", articleNum);
    }

    /**
     * 所有文章
     * @param model
     * @return
     */
    private void requestArticle(Model model) {
        List<ArticleDto> articleList = DynamicAPI.list(null);
        model.addAttribute("articleList", articleList);
    }
}
