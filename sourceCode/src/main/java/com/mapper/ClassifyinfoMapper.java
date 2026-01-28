package com.mapper;

import com.entity.Classifyinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper

public interface ClassifyinfoMapper {

    // 插入数据 调用entity包classifyinfo.xml里的insertClassifyinfo配置
    void insert(Classifyinfo classifyinfo) ;

    // 更新数据 调用entity包classifyinfo.xml里的updateClassifyinfo配置
    void update(Classifyinfo classifyinfo) ;

    // 删除数据 调用entity包classifyinfo.xml里的deleteClassifyinfo配置
    void delete(String classifyinfoid);

    // 查询全部数据 调用entity包classifyinfo.xml里的getAllClassifyinfo配置
    List<Classifyinfo> getAll(Map<String, Object> params) ;
    // 查询总行数 调用entity包Classifyinfo.xml里的配置
    int getRowSize(Map<String, Object> params) ;




    // 按照类里面的值精确查询 调用entity包classifyinfo.xml里的getClassifyinfoByCond配置
    List<Classifyinfo> getByCond(Classifyinfo classifyinfo) ;

    // 按照Classifyinfo类里面的值模糊查询 调用entity包classifyinfo.xml里的getClassifyinfoByLike配置
    List<Classifyinfo> getByLike(Classifyinfo classifyinfo) ;

    // 按主键查询表返回单一的Classifyinfo实例 调用entity包classifyinfo.xml里的getClassifyinfoById配置
    Classifyinfo getById(String classifyinfoid) ;


}
