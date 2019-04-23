package com.yyh.yuu.blog.web.ui.controller;

import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.domain.Main;
import com.yyh.yuu.blog.web.ui.api.ColumnApi;
import com.yyh.yuu.blog.web.ui.api.MainApi;
import com.yyh.yuu.blog.web.ui.api.ToolApi;
import com.yyh.yuu.blog.web.ui.dto.ToolDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Classname IndexController
 * @Date 2018/11/17 12:51
 * @Created by Yuu
 */
@Controller
public class IndexController {

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        // 请求工具栏
        requestTools(session);
        // 请求背景图片和专栏
        requestBanner(session);
        // 请求专栏
        requestColumn(model);
        return "index";
    }

    /**
     * 请求工具栏
     * @param session
     */
    private void requestTools(HttpSession session) {
        List<ToolDto> toolDtos = ToolApi.tool();
        session.setAttribute("toolDtos", toolDtos);
    }

    /**
     * 请求标语和背景图片
     * @param session
     */
    private void requestBanner(HttpSession session) {
        Main main = MainApi.getMain();
        session.setAttribute("main", main);
    }

    /**
     * 请求专栏
     * @param model
     */
    private void requestColumn(Model model) {
        List<Column> columnList = ColumnApi.getColumnList();
        model.addAttribute("columnList", columnList);
    }
}
