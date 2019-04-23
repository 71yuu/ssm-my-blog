package com.yyh.yuu.blog.domain;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * @Classname Tool
 * @Date 2018/11/13 11:04
 * @Created by Yuu
 */
@Data
public class Tool extends BaseEntity {
    private Integer pid;

    @Length(min = 1, max = 20, message = "工具名称不能为空")
    private String tname;

    @NotNull(message = "链接地址不能为空")
    private String link;

    private boolean isParent;

}
