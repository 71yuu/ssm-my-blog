package com.yyh.yuu.blog.web.ui.api;


import com.yyh.yuu.blog.commons.utils.HttpClientUtils;
import com.yyh.yuu.blog.commons.utils.MapperUtils;
import com.yyh.yuu.blog.web.ui.dto.ToolDto;

import java.util.List;

/**
 * 工具管理接口
 * @Classname ToolApi
 * @Date 2018/11/17 13:33
 * @Created by Yuu
 */
public class ToolApi {

    public static List<ToolDto> tool() {
        List<ToolDto> tools = null;
        String result = HttpClientUtils.doGet(API.API_TOOL);
        try {
            tools = MapperUtils.json2listByTree(result, "data", ToolDto.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tools;
    }
}
