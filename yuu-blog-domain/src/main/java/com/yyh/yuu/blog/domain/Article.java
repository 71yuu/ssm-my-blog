package com.yyh.yuu.blog.domain;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * 文章
 * @Classname Article
 * @Date 2018/11/13 10:56
 * @Created by Yuu
 */
@Data
public class Article extends BaseEntity {
    private Integer cid;

    private String aname;

    private String author;

    private Integer click;

    private String content;

    private String html;

}
