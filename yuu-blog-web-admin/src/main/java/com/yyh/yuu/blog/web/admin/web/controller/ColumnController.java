package com.yyh.yuu.blog.web.admin.web.controller;

import com.yyh.yuu.blog.commons.constant.ConstantUtils;
import com.yyh.yuu.blog.domain.Column;
import com.yyh.yuu.blog.web.admin.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @Classname ColumnController
 * @Date 2018/11/15 10:13
 * @Created by Yuu
 */
@Controller
@RequestMapping("column")
public class ColumnController {

    @Autowired
    private ColumnService columnService;

    /**
     * 在所有 Controller 之前执行的方法
     * @param id
     * @return
     */
    @ModelAttribute
    public Column getColumnBy(Integer id) {
        Column column = null;

        // 如果 id 不为空，则从数据库中获取
        if (id != null) {
            column = columnService.getById(id);
        } else {
            column = new Column();
        }

        return column;
    }

    /**
     * 跳转到专栏页面
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Column> columnList = columnService.getAll();
        model.addAttribute("columnList", columnList);
        return "column";
    }

    /**
     * 跳转到添加编辑专栏页面
     * @return
     */
    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form() {
        return "column_form";
    }

    /**
     * 保存专栏
     * @param multipartFile
     * @param cname
     * @param request
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "backimg", required = false)MultipartFile multipartFile, @RequestParam("cname") String cname, @RequestParam("desc") String desc, @RequestParam(value = "id", required = false) Integer id, HttpServletRequest request) {
        String imgPath;
        Column column = new Column();
        if (multipartFile.getSize() > 0) {
            imgPath = uploadImg(multipartFile, request);
             column.setImg(imgPath);
        }
        column.setId(id);
        column.setCname(cname);
        column.setDescribe(desc);
        columnService.save(column);
        return "redirect:/column/list";
    }

    /**
     * 编辑专栏
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit() {
        return "column_form";
    }

    /**
     * 删除专栏
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(Integer id) {
        columnService.deleteById(id);
        return "redirect:/column/list";
    }

    /**
     * 将图片写入指定目录
     * @param multipartFile
     * @param request
     * @return
     */
    private String uploadImg(MultipartFile multipartFile, HttpServletRequest request) {
        // 获取文件后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        // 文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(ConstantUtils.UPLOAD_PATH);

        // 判断路径是否存在，不存在则创建文件夹
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        // 将文件写入目标
        file = new File(filePath, UUID.randomUUID() + fileSuffix);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 返回文件完整路径
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return serverPath + ConstantUtils.UPLOAD_PATH + file.getName();
    }
}
