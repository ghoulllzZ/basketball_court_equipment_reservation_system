package com.service;

import com.entity.Broadcast;
import com.mapper.BroadcastMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service

public class BroadcastService {
    @Autowired
    private BroadcastMapper broadcastMapper;

    // 插入数据 调用entity包broadcast.xml里的insertBroadcast配置
    public void insert(Broadcast broadcast) {
        broadcastMapper.insert(  broadcast);
    }

    // 更新数据 调用entity包broadcast.xml里的updateBroadcast配置
    public void update(Broadcast broadcast) {
        broadcastMapper.update(  broadcast);
    }

    // 删除数据 调用entity包broadcast.xml里的deleteBroadcast配置
    public void delete(String broadcastid) {
        broadcastMapper.delete(  broadcastid);
    }

    // 查询全部数据 调用entity包broadcast.xml里的getAllBroadcast配置
    public List<Broadcast> getAll(Map<String, Object> params) {
        return broadcastMapper.getAll( params);
    }
    // 查询总行数 调用entity包Broadcast.xml里的配置
    public int getRowSize(Map<String, Object> params) {
        return broadcastMapper.getRowSize( params);
    }




    public List<Broadcast> getTop() {
        return broadcastMapper.getTop( );
    }

    public List<Broadcast> getFlv() {
        return broadcastMapper.getFlv( );
    }

    public List<Broadcast> getByBroadcast_kinds(String broadcast_kindsid) {
        return broadcastMapper.getByBroadcast_kinds(  broadcast_kindsid);
    }

    // 按照类里面的值精确查询 调用entity包broadcast.xml里的getBroadcastByCond配置
    public List<Broadcast> getByCond(Broadcast broadcast) {
        return broadcastMapper.getByCond(  broadcast);
    }

    // 按照Broadcast类里面的值模糊查询 调用entity包broadcast.xml里的getBroadcastByLike配置
    public List<Broadcast> getByLike(Broadcast broadcast) {
        return broadcastMapper.getByLike(  broadcast);
    }


    // 按主键查询表返回单一的Broadcast实例 调用entity包broadcast.xml里的getBroadcastById配置
    public Broadcast getById(String broadcastid) {
        return broadcastMapper.getById(  broadcastid);
    }


}
