package com.mapper;

import com.entity.Broadcast_kinds;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper

public interface  Broadcast_kindsMapper {
// 插入数据 调用entity包broadcast_kinds.xml里的insertBroadcast_kinds配置
    void insert(Broadcast_kinds broadcast_kinds) ;

    // 更新数据 调用entity包broadcast_kinds.xml里的updateBroadcast_kinds配置
    void update(Broadcast_kinds broadcast_kinds) ;

    // 删除数据 调用entity包broadcast_kinds.xml里的deleteBroadcast_kinds配置
    void delete(String broadcast_kindsid) ;

    // 查询全部数据 调用entity包broadcast_kinds.xml里的getAllBroadcast_kinds配置
    List<Broadcast_kinds> getAll(Map<String, Object> params) ;
    // 查询总行数 调用entity包Broadcast_kinds.xml里的配置
    int getRowSize(Map<String, Object> params) ;




    // 按照类里面的值精确查询 调用entity包broadcast_kinds.xml里的getBroadcast_kindsByCond配置
    List<Broadcast_kinds> getByCond(Broadcast_kinds broadcast_kinds) ;

    // 按照Broadcast_kinds类里面的值模糊查询 调用entity包broadcast_kinds.xml里的getBroadcast_kindsByLike配置
    List<Broadcast_kinds> getByLike(Broadcast_kinds broadcast_kinds) ;

    // 按主键查询表返回单一的Broadcast_kinds实例 调用entity包broadcast_kinds.xml里的getBroadcast_kindsById配置
    Broadcast_kinds getById(String broadcast_kindsid) ;

}
