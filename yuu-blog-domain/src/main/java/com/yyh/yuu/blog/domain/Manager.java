package com.yyh.yuu.blog.domain;

import com.yyh.yuu.blog.commons.persistence.BaseEntity;
import lombok.Data;

/**
 * @Classname Manager
 * @Date 2018/11/13 11:03
 * @Created by Yuu
 */
@Data
public class Manager extends BaseEntity {
    private String username;

    private String password;

    private String phone;

}
