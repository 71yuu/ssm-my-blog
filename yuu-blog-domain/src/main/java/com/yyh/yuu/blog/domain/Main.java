package com.yyh.yuu.blog.domain;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * 主页
 * @Classname Main
 * @Date 2018/11/13 11:02
 * @Created by Yuu
 */
@Data
public class Main extends BaseEntity {
    private String h1;

    private String h2;

    private String h3;

    private String img;

    private String h4;
}
