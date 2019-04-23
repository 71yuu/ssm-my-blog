package com.yyh.yuu.blog.web.api.dto;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import com.yyh.yuu.blog.domain.Tool;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


/**
 * 工具传输对象
 */
@Data
public class ToolDto extends BaseEntity implements Serializable {
    private String tname;
    private String link;
    private List<Tool> tools;
}
