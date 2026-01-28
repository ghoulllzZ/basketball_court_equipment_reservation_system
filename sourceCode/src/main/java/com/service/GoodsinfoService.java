package com.service;

import com.mapper.GoodsinfoMapper;
import com.entity.Broadcast;
import com.entity.Goodsinfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("goodsinfo")
public class GoodsinfoService {

    @Resource
    private GoodsinfoMapper goodsinfoMapper;

    // 插入数据 调用dAO里的insertGoodsinfo配置
    public void insert(Goodsinfo goodsinfo) {
          goodsinfoMapper.insert(  goodsinfo);
    }

    // 更新数据 调用dAO里的updateGoodsinfo配置
    public void update(Goodsinfo goodsinfo) {
        goodsinfoMapper.update(  goodsinfo);
    }

    // 删除数据 调用dAO里的deleteGoodsinfo配置
    public void delete(String goodsinfoid) {
        goodsinfoMapper.delete(  goodsinfoid);
    }

    // 查询全部数据 调用dAO里的getAllGoodsinfo配置
    public List<Goodsinfo> getAll(Map<String, Object> params) {
        return goodsinfoMapper.getAll( params);
    }

    // 查询总行数 调用dAO里的配置
    public int getRowSize(Map<String, Object> params) {
        return goodsinfoMapper.getRowSize( params);
    }






    // 按主键查询表返回单一的Goodsinfo实例 调用dAO里的getGoodsinfoById配置
    public Goodsinfo getById(String goodsinfoid) {
        return goodsinfoMapper.getById( goodsinfoid);
    }




}
