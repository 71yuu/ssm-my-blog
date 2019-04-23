package com.yyh.yuu.blog.web.api.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.domain.Main;
import com.yyh.yuu.blog.web.api.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname MainController
 * @Date 2018/11/17 17:15
 * @Created by Yuu
 */
@Controller
@RequestMapping("${api.path}")
public class MainController {

    @Autowired
    private MainService mainService;

    @RequestMapping(value = "main", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult getMain() {
        Main main = mainService.getMain();
        return BaseResult.success("成功", main);
    }
}
