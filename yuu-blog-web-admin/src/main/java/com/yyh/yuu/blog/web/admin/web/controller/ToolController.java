package com.yyh.yuu.blog.web.admin.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.domain.Tool;
import com.yyh.yuu.blog.web.admin.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname ToolController
 * @Date 2018/11/13 19:48
 * @Created by Yuu
 */
@Controller
@RequestMapping("tool")
public class ToolController{

    @Autowired
    private ToolService toolService;

    /**
     * 会在执行所有 Controller 之前执行
     * @param id
     * @return
     */
    @ModelAttribute
    public Tool getTol(Integer id) {
        Tool tool = null;

        // id 不为空，则从数据库获取
        if (id != null) {
            tool = toolService.getById(id);
        } else {
            tool = new Tool();
        }

        return tool;
    }

    /**
     * treeTable 遍历
     * @param model
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Tool> targetList = new ArrayList<>();
        List<Tool> sourceList = toolService.selectAll();

        // 排序
        sortList(sourceList, targetList, 0);

        model.addAttribute("toolList", targetList);
        return "tool";
    }

    /**
     * 跳转到新增编辑页面
     * @return
     */
    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(String pid, Model model) {
        model.addAttribute("pid", pid);
        return "tool_form";
    }

    /**
     * 保存新增或编辑
     * @param tool
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Tool tool, Model model) {
        BaseResult baseResult = toolService.save(tool);

        if (baseResult.getStatus() == 200) {
            return "redirect:/tool/list";
        } else {
            model.addAttribute("baseResult", baseResult);
            return "tool_form";
        }
    }

    /**
     * 删除工具
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(String id) {
        toolService.delete(id);
        return "redirect:/tool/list";
    }

    /**
     * 排序 treeTable
     * @param sourceList
     * @param targetList
     * @param pid
     */
    private void sortList(List<Tool> sourceList, List<Tool> targetList, Integer pid) {
        for (Tool tool : sourceList) {
            if (tool.getPid().equals(pid)){
                targetList.add(tool);

                // 判断有没有子节点,如果有则继续追加
                if (tool.isParent()) {
                    for (Tool tool1 : sourceList) {
                        if (tool1.getPid().equals(tool.getId())) {
                            sortList(sourceList, targetList, tool.getId());
                            break;
                        }
                    }
                }
            }
        }
    }

}
