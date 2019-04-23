package com.yyh.yuu.blog.web.admin.web.controller;

import com.yyh.yuu.blog.commons.constant.ConstantUtils;
import com.yyh.yuu.blog.commons.dto.PageInfo;
import com.yyh.yuu.blog.domain.Article;
import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.admin.service.ArticleService;
import com.yyh.yuu.blog.web.admin.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Classname ArticleController
 * @Date 2018/11/15 16:00
 * @Created by Yuu
 */
@Controller
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private ColumnService columnService;

    @Autowired
    private ArticleService articleService;

    @ModelAttribute
    public Article getArticleById(Integer id) {
        Article article = new Article();
        // 新增
        if (id != null) {
            article = articleService.getById(id);
        }

        // 编辑
        else {
            article = new Article();
        }
        return article;
    }

    /**
     * 跳转到文章列表页面
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Article> articleList = articleService.getAll();
        List<Column> columnList = columnService.getAll();
        model.addAttribute("articleList", articleList);
        model.addAttribute("columnList", columnList);
        return "article";
    }

    /**
     * 跳转到文章表单页面
     * @return
     */
    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Model model) {
        List<Column> columnList = columnService.getAll();
        model.addAttribute(ConstantUtils.COLUMN_LIST, columnList);
        return "article_form";
    }

    /**
     * 上传内容的图片
     * @param multipartFile
     * @param request
     * @return
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadImg(@RequestParam(value = "editormd-image-file", required = true) MultipartFile multipartFile, HttpServletRequest request){
        // 获取文件后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        // 文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(ConstantUtils.UPLOAD_PATH);

        // 判断路径是否存在，不存在则创建文件夹
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }

        // 将文件写入目标
        file = new File(filePath, UUID.randomUUID() + fileSuffix);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 文件完整路径
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + ConstantUtils.UPLOAD_PATH + file.getName();

        // 返回的数据结果
        Map<String, Object> result = new HashMap<>();
        result.put("success", 1);
        result.put("message", "图片上传成功");
        result.put("url", serverPath);

        return result;
    }

    /**
     * 保存或编辑文章
     * @param article
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Article article){
        article.setAuthor("杨雨衡");
        articleService.save(article);
        return "redirect:/article/list";
    }

    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(String id) {
        articleService.delete(id);
        return "redirect:/article/list";
    }

    /**
     * 搜索功能
     * @param cid
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(String cid, String key, Model model) {
        List<Article> articleList = articleService.search(cid, key);
        List<Column> columnList = columnService.getAll();
        model.addAttribute("articleList", articleList);
        model.addAttribute("columnList", columnList);
        model.addAttribute("cid",cid);
        model.addAttribute("key", key);
        return "article";
    }

    /**
     * 分页查询
     * @param request
     * @return
     */
    @RequestMapping(value = "page", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<Article> page(HttpServletRequest request) {
        String draw = request.getParameter("draw");
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        String cid = request.getParameter("cid");
        String key = request.getParameter("key");

        if ("0".equals(cid)) {
            cid = null;
        }

        Map<String, Object> params = new HashMap<>();
        params.put("page", start);
        params.put("pageSize", length);
        params.put("cid", cid);
        params.put("key", key);

        PageInfo<Article> pageInfo = articleService.page(params);
        pageInfo.setDraw(draw == null ? 0 : Integer.parseInt(draw));
        return pageInfo;
    }
}
