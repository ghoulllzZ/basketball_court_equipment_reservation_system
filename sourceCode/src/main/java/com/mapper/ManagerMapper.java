package com.mapper;

import com.entity.Manager;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper
public interface ManagerMapper {

    // 插入数据 调用entity包manager.xml里的insertManager配置
      void insert(Manager manager) ;

    // 更新数据 调用entity包manager.xml里的updateManager配置
      void update(Manager manager);

    // 删除数据 调用entity包manager.xml里的deleteManager配置
     void delete(String managerid) ;

    // 查询全部数据 调用entity包manager.xml里的getAllManager配置
      List<Manager> getAll(Map<String, Object> params)  ;

    // 查询总行数 调用entity包manager.xml里的配置
      int getRowSize(Map<String, Object> params) ;






    // 按照类里面的值精确查询 调用entity包manager.xml里的getManagerByCond配置
     List<Manager> getByCond(Manager manager) ;

    // 按照类里面的值模糊查询 调用entity包manager.xml里的getManagerByLike配置
     List<Manager> getByLike(Manager manager) ;

    // 按主键查询表返回单一的Manager实例 调用entity包manager.xml里的getManagerById配置
     Manager getById(String managerid);



}
