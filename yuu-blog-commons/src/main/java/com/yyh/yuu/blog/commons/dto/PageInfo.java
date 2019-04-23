package com.yyh.yuu.blog.commons.dto;

/**
 * @Classname PageInfo
 * @Date 2018/11/16 20:20
 * @Created by Yuu
 */

import com.yyh.yuu.blog.commons.persistence.BaseEntity;

import java.io.Serializable;
import java.util.List;

/**
 * 分页展示对象
 * <p>Title: PageInfo</p>
 * <p>Description: </p>
 *
 * @author Yuu
 * @version 1.0.0
 * @date 2018/6/21 5:17
 */
public class PageInfo<T extends BaseEntity> implements Serializable {
    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private List<T> data;
    private String error;

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
