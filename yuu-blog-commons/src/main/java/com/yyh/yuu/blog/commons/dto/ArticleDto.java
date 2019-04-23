package com.yyh.yuu.blog.commons.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Classname ArticleDto
 * @Date 2018/11/19 9:54
 * @Created by Yuu
 */
@Data
public class ArticleDto implements Serializable {
    private Integer id;
    private String cname;
    private String aname;
    private String author;
    private Date created;
}
