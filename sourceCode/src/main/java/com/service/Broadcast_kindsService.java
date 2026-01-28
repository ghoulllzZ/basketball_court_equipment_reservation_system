package com.service;

import com.entity.Broadcast_kinds;
import com.mapper.Broadcast_kindsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Broadcast_kindsService {
    @Autowired
    private Broadcast_kindsMapper broadcast_kindsMapper;

    // 插入数据 调用entity包broadcast_kinds.xml里的insertBroadcast_kinds配置
    public void insert(Broadcast_kinds broadcast_kinds) {
        broadcast_kindsMapper.insert(  broadcast_kinds);
    }

    // 更新数据 调用entity包broadcast_kinds.xml里的updateBroadcast_kinds配置
    public void update(Broadcast_kinds broadcast_kinds) {
        broadcast_kindsMapper.update(  broadcast_kinds);
    }

    // 删除数据 调用entity包broadcast_kinds.xml里的deleteBroadcast_kinds配置
    public void delete(String broadcast_kindsid) {
        broadcast_kindsMapper.delete(  broadcast_kindsid);
    }

    // 查询全部数据 调用entity包broadcast_kinds.xml里的getAllBroadcast_kinds配置
    public List<Broadcast_kinds> getAll(Map<String, Object> params) {
        return broadcast_kindsMapper.getAll( params);
    }
    // 查询总行数 调用entity包Broadcast_kinds.xml里的配置
    public int getRowSize(Map<String, Object> params) {
        return broadcast_kindsMapper.getRowSize( params);
    }




    // 按照类里面的值精确查询 调用entity包broadcast_kinds.xml里的getBroadcast_kindsByCond配置
    public List<Broadcast_kinds> getByCond(Broadcast_kinds broadcast_kinds) {
        return broadcast_kindsMapper.getByCond(  broadcast_kinds);
    }

    // 按照Broadcast_kinds类里面的值模糊查询 调用entity包broadcast_kinds.xml里的getBroadcast_kindsByLike配置
    public List<Broadcast_kinds> getByLike(Broadcast_kinds broadcast_kinds) {
        return broadcast_kindsMapper.getByLike(  broadcast_kinds);
    }

    // 按主键查询表返回单一的Broadcast_kinds实例 调用entity包broadcast_kinds.xml里的getBroadcast_kindsById配置
    public Broadcast_kinds getById(String broadcast_kindsid) {
        return broadcast_kindsMapper.getById(  broadcast_kindsid);
    }

}
