package com.yyh.yuu.blog.web.admin.web.controller;

import com.yyh.yuu.blog.commons.constant.ConstantUtils;
import com.yyh.yuu.blog.domain.Main;
import com.yyh.yuu.blog.web.admin.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Classname MainImgController
 * @Date 2018/11/14 18:36
 * @Created by Yuu
 */
@Controller
@RequestMapping("main")
public class MainController {

    @Autowired
    private MainService mainService;

    /**
     * 跳转到图片页面
     * @param model
     * @return
     */
    @RequestMapping(value = "img", method = RequestMethod.GET)
    public String img(Model model) {
        String imtPath = mainService.getImgPath();
        model.addAttribute("img", imtPath);
        return "main_img";
    }

    /**
     * 背景图片上传
     * @param multipartFile
     * @param request
     * @return
     */
    @RequestMapping(value = "img/upload", method = RequestMethod.POST)
    public String uploadImg(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request) {
        // 获取文件后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        // 文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(ConstantUtils.UPLOAD_PATH);

        // 判断路径是否存在，不存在则创建文件
        File file = new File(filePath, UUID.randomUUID() + fileSuffix);
        if (!file.exists()) {
            file.mkdirs();
        }
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 返回文件完整路径
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

        String targetPath = serverPath + ConstantUtils.UPLOAD_PATH + file.getName();

        mainService.uploadImg(targetPath);

        return "redirect:/main/img";
    }


    /**
     * 跳转到标语页面
     * @param model
     * @return
     */
    @RequestMapping(value = "banner", method = RequestMethod.GET)
    public String banner(Model model) {
        Main main = mainService.getMain();
        model.addAttribute("main", main);
        return "banner";
    }

    /**
     * 编辑标语
     * @param main
     * @return
     */
    @RequestMapping(value = "banner/edit", method = RequestMethod.GET)
    public String banner(Main main, Model model) {
        String h1 = main.getH1();
        String h2 = main.getH2();
        String h3 = main.getH3();
        String h4 = main.getH4();
        String name;
        if (h1 != null) {
            name = "h1";
        } else if (h2 != null) {
            name = "h2";
        } else if (h3 != null) {
            name = "h3";
        } else if (h4 != null){
            name = "h4";
        } else {
            name = "";
        }
        model.addAttribute("main", main);
        model.addAttribute("name", name);
        return "banner_form";
    }

    /**
     * 保存标语
     * @param main
     * @return
     */
    @RequestMapping(value = "banner/save", method = RequestMethod.POST)
    public String save(Main main){
        mainService.saveBanner(main);
        return "redirect:/main/banner";
    }
}
