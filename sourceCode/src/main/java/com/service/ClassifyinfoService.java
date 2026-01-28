package com.service;


import com.entity.Classifyinfo;
import com.mapper.ClassifyinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ClassifyinfoService {
    @Autowired
    private ClassifyinfoMapper classifyinfoMapper;

    // 插入数据 调用dAO里的insertClassifyinfo配置
    public void insert(Classifyinfo classifyinfo) {
        classifyinfoMapper.insert( classifyinfo);
    }

    // 更新数据 调用dAO里的updateClassifyinfo配置
    public void update(Classifyinfo classifyinfo) {
        classifyinfoMapper.update( classifyinfo);
    }

    // 删除数据 调用dAO里的deleteClassifyinfo配置
    public void delete(String classifyinfoid) {
        classifyinfoMapper.delete(  classifyinfoid);
    }

    // 查询全部数据 调用dAO里的getAllClassifyinfo配置
    public List<Classifyinfo> getAll(Map<String, Object> params) {
        return classifyinfoMapper.getAll(  params);
    }

    // 查询总行数 调用dAO里的配置
    public int getRowSize(Map<String, Object> params) {
        return classifyinfoMapper.getRowSize(  params);
    }


    // 按照类里面的值精确查询 调用dAO里的getClassifyinfoByCond配置
    public List<Classifyinfo> getByCond(Classifyinfo classifyinfo) {
        return classifyinfoMapper.getByCond( classifyinfo);
    }

    // 按照Classifyinfo类里面的值模糊查询 调用dAO里的getClassifyinfoByLike配置
    public List<Classifyinfo> getByLike(Classifyinfo classifyinfo) {
        return classifyinfoMapper.getByLike(  classifyinfo);
    }

    // 按主键查询表返回单一的Classifyinfo实例 调用dAO里的getClassifyinfoById配置
    public Classifyinfo getById(String classifyinfoid) {
        return classifyinfoMapper.getById(  classifyinfoid);
    }


}
