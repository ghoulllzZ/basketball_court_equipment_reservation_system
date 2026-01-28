package com.mapper;

import com.entity.Thinginfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper

public interface ThinginfoMapper {
    // 插入数据 调用entity包thinginfo.xml里的insertThinginfo配置
    void insert(Thinginfo thinginfo) ;

    // 更新数据 调用entity包thinginfo.xml里的updateThinginfo配置
    void update(Thinginfo thinginfo);

    // 删除数据 调用entity包thinginfo.xml里的deleteThinginfo配置
    void delete(String thinginfoid) ;

    // 查询全部数据 调用entity包thinginfo.xml里的getAllThinginfo配置
    List<Thinginfo> getAll(Map<String, Object> params)  ;

    // 查询总行数 调用entity包thinginfo.xml里的配置
    int getRowSize(Map<String, Object> params) ;






    // 按照Thinginfo类里面的值精确查询 调用entity包thinginfo.xml里的getThinginfoByCond配置
    List<Thinginfo> getByCond(Thinginfo thinginfo) ;

    // 按照Thinginfo类里面的值模糊查询 调用entity包thinginfo.xml里的getThinginfoByLike配置
    List<Thinginfo> getByLike(Thinginfo thinginfo) ;

    // 按主键查询表返回单一的Thinginfo实例 调用entity包thinginfo.xml里的getThinginfoById配置
    Thinginfo getById(String thinginfoid);


}