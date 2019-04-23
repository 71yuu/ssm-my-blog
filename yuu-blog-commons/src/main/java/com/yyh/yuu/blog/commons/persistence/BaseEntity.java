package com.yyh.yuu.blog.commons.persistence;


import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体类的基类
 * @Classname BaseEntity
 * @Date 2018/11/13 10:51
 * @Created by Yuu
 */
@Data
public abstract class BaseEntity implements Serializable {
    private Integer id;
    private Date created;
    private Date updated;

}
