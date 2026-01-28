package com.mapper;

import com.entity.Purchases;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper

public interface PurchasesMapper {
// 插入数据 调用entity包purchases.xml里的insertPurchases配置
    void insert(Purchases purchases) ;
    // 更新数据 调用entity包purchases.xml里的updatePurchases配置
    void update(Purchases purchases) ;

    // 删除数据 调用entity包purchases.xml里的deletePurchases配置
    void delete(String purchasesid);

    // 查询全部数据 调用entity包purchases.xml里的getAllPurchases配置
    List<Purchases> getAll(Map<String, Object> params) ;
    // 查询总行数 调用entity包Purchases.xml里的配置
    int getRowSize(Map<String, Object> params) ;


/* <!--获取预约单价成功的数量-->*/
    int getPurchasesNumber(int thinginfoid) ;




    // 按照类里面的值精确查询 调用entity包purchases.xml里的getPurchasesByCond配置
    List<Purchases> getByCond(Purchases purchases) ;

    // 按照Purchases类里面的值模糊查询 调用entity包purchases.xml里的getPurchasesByLike配置
    List<Purchases> getByLike(Purchases purchases) ;

    // 按主键查询表返回单一的Purchases实例 调用entity包purchases.xml里的getPurchasesById配置
    Purchases getById(String purchasesid) ;

}
