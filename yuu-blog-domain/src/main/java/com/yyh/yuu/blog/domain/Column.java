package com.yyh.yuu.blog.domain;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * 专栏
 * @Classname Column
 * @Date 2018/11/13 11:00
 * @Created by Yuu
 */
@Data
public class Column extends BaseEntity {
    private String img;

    private String cname;

    private String describe;

}
