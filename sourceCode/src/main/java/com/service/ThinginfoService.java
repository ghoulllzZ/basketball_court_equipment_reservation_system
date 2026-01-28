package com.service;

import com.entity.Thinginfo;
import com.mapper.ThinginfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ThinginfoService {

    @Autowired
    private ThinginfoMapper thinginfoMapper;

    // 插入数据 调用dAO里的insertThinginfo配置
    public void insert(Thinginfo thinginfo) {
          thinginfoMapper.insert(  thinginfo);
    }

    // 更新数据 调用dAO里的updateThinginfo配置
    public void update(Thinginfo thinginfo) {
        thinginfoMapper.update(  thinginfo);
    }

    // 删除数据 调用dAO里的deleteThinginfo配置
    public void delete(String thinginfoid) {
        thinginfoMapper.delete(  thinginfoid);
    }

    // 查询全部数据 调用dAO里的getAllThinginfo配置
    public List<Thinginfo> getAll(Map<String, Object> params) {
        return thinginfoMapper.getAll( params);
    }

    // 查询总行数 调用dAO里的配置
    public int getRowSize(Map<String, Object> params) {
        return thinginfoMapper.getRowSize( params);
    }







    // 按主键查询表返回单一的Thinginfo实例 调用dAO里的getThinginfoById配置
    public Thinginfo getById(String thinginfoid) {
        return thinginfoMapper.getById( thinginfoid);
    }




}
