package com.mapper;

 import com.entity.Goodsinfo;
 import org.apache.ibatis.annotations.Mapper;

 import java.util.List;
import java.util.Map;


@Mapper
public interface GoodsinfoMapper {
    // 插入数据 调用entity包goodsinfo.xml里的insertGoodsinfo配置
    void insert(Goodsinfo goodsinfo) ;

    // 更新数据 调用entity包goodsinfo.xml里的updateGoodsinfo配置
    void update(Goodsinfo goodsinfo);

    // 删除数据 调用entity包goodsinfo.xml里的deleteGoodsinfo配置
    void delete(String goodsinfoid) ;

    // 查询全部数据 调用entity包goodsinfo.xml里的getAllGoodsinfo配置
    List<Goodsinfo> getAll(Map<String, Object> params)  ;

    // 查询总行数 调用entity包goodsinfo.xml里的配置
    int getRowSize(Map<String, Object> params) ;





    // 按照Goodsinfo类里面的值精确查询 调用entity包goodsinfo.xml里的getGoodsinfoByCond配置
    List<Goodsinfo> getByCond(Goodsinfo goodsinfo) ;

    // 按照Goodsinfo类里面的值模糊查询 调用entity包goodsinfo.xml里的getGoodsinfoByLike配置
    List<Goodsinfo> getByLike(Goodsinfo goodsinfo) ;

    // 按主键查询表返回单一的Goodsinfo实例 调用entity包goodsinfo.xml里的getGoodsinfoById配置
    Goodsinfo getById(String goodsinfoid);


}