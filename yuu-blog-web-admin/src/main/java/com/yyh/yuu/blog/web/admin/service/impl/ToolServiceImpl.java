package com.yyh.yuu.blog.web.admin.service.impl;

import com.yyh.yuu.blog.commons.dto.BaseResult;
import com.yyh.yuu.blog.commons.validator.BeanValidator;
import com.yyh.yuu.blog.domain.Tool;
import com.yyh.yuu.blog.web.admin.dao.ToolDao;
import com.yyh.yuu.blog.web.admin.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname ToolServiceImpl
 * @Date 2018/11/13 21:58
 * @Created by Yuu
 */
@Service
public class ToolServiceImpl implements ToolService {

    @Autowired
    private ToolDao toolDao;

    @Override
    public List<Tool> selectAll() {
        return toolDao.selectAll();
    }

    @Override
    public Tool getById(Integer id) {
        return toolDao.getById(id);
    }

    @Override
    public BaseResult save(Tool tool) {
        String validator = BeanValidator.validator(tool);
        if (validator != null) {
            return BaseResult.fail(validator);
        } else {
            // 新增
            if (tool.getPid() != null) {
                toolDao.insert(tool);
                if (tool.getPid() == 1) {
                    tool.setParent(true);
                }
            } else {
                toolDao.update(tool);
            }
        }
        return BaseResult.success("保存工具信息成功");
    }

    @Override
    public void delete(String id) {
        toolDao.deleteById(id);
        toolDao.deleteByPid(id);
    }
}
