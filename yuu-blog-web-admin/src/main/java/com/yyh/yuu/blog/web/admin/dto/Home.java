package com.yyh.yuu.blog.web.admin.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Classname Home
 * @Date 2018/11/13 19:12
 * @Created by Yuu
 */
@Data
public class Home implements Serializable {
    private Integer articleNum;

    private Integer columnNum;

    private Integer articleClick;
}
