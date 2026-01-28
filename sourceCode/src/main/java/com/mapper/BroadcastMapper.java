package com.mapper;

import com.entity.Broadcast;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper
public interface  BroadcastMapper {
// 插入数据 调用entity包broadcast.xml里的insertBroadcast配置
    void insert(Broadcast broadcast) ;

    // 更新数据 调用entity包broadcast.xml里的updateBroadcast配置
    void update(Broadcast broadcast) ;

    // 删除数据 调用entity包broadcast.xml里的deleteBroadcast配置
    void delete(String broadcastid) ;

    // 查询全部数据 调用entity包broadcast.xml里的getAllBroadcast配置
    List<Broadcast> getAll(Map<String, Object> params) ;
    // 查询总行数 调用entity包Broadcast.xml里的配置
    int getRowSize(Map<String, Object> params) ;




    List<Broadcast> getTop() ;

    List<Broadcast> getFlv() ;

    List<Broadcast> getByBroadcast_kinds(String broadcast_kindsid) ;

    // 按照类里面的值精确查询 调用entity包broadcast.xml里的getBroadcastByCond配置
    List<Broadcast> getByCond(Broadcast broadcast) ;

    // 按照Broadcast类里面的值模糊查询 调用entity包broadcast.xml里的getBroadcastByLike配置
    List<Broadcast> getByLike(Broadcast broadcast) ;
    // 按主键查询表返回单一的Broadcast实例 调用entity包broadcast.xml里的getBroadcastById配置
    Broadcast getById(String broadcastid) ;

}
