package com.yyh.yuu.blog.web.api.web.controller;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.domain.Tool;
import com.yyh.yuu.blog.web.api.dto.ToolDto;
import com.yyh.yuu.blog.web.api.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname ToolController
 * @Date 2018/11/17 14:38
 * @Created by Yuu
 */
@Controller
@RequestMapping(value = "${api.path}")
public class ToolController {

    @Autowired
    private ToolService toolService;

    /**
     * 工具接口
     * @return
     */
    @RequestMapping(value = "tool", method = RequestMethod.GET)
    @ResponseBody
    public BaseResult getParent() {
        List<Tool> toolParent = toolService.getParent();
        List<Tool> toolItem = toolService.getItem();
        List<ToolDto> toolDtoList = new ArrayList<>();
        for (Tool tool : toolParent) {
            ToolDto toolDto = new ToolDto();
            if (tool.getId() == 1) {
                continue;
            }
            toolDto.setId(tool.getId());
            toolDto.setTname(tool.getTname());
            toolDto.setLink(tool.getLink());
            List<Tool> tools = new ArrayList<>();
            for (Tool tool1 : toolItem) {
                if (tool1.getPid() == tool.getId()) {
                    tools.add(tool1);
                }
            }
            toolDto.setTools(tools);
            toolDtoList.add(toolDto);
        }
        return BaseResult.success("成功", toolDtoList);
    }
}
