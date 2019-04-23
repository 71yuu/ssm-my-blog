package com.yyh.yuu.blog.web.admin.web.controller;

import com.yyh.yuu.blog.commons.constant.ConstantUtils;
import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.domain.Manager;
import com.yyh.yuu.blog.web.admin.dto.Home;
import com.yyh.yuu.blog.web.admin.service.ArticleService;
import com.yyh.yuu.blog.web.admin.service.ManagerService;
import com.yyh.yuu.blog.web.admin.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 后台系统登录控制器
 * @Classname LoginController
 * @Date 2018/11/13 14:47
 * @Created by Yuu
 */
@Controller
public class LoginController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private HomeService homeService;

    @Autowired
    private ArticleService articleService;

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * 登录逻辑
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam(required = true) String username, @RequestParam(required = true) String password, Model model, HttpSession session) {
        Manager manager = managerService.login(username, password);

        // 登录失败
        if (manager == null) {
            model.addAttribute("message", "用户名或密码错误请重新输入");
            return login();
        }

        // 登录成功
        else {
            // 将登录信息放入会话
            session.setAttribute(ConstantUtils.SESSION_MANAGER, manager);
            return "redirect:/home";
        }
    }

    /**
     * 跳转到管理首页
     * @return
     */
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String home(Model model) {
        Home home = homeService.getHome();
        List<Article> articleList = articleService.getNew();
        model.addAttribute("home", home);
        model.addAttribute("articleList", articleList);
        return "home";
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
