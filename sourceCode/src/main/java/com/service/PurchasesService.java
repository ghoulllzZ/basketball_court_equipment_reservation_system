package com.service;

import com.entity.Purchases;
import com.mapper.PurchasesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service

public class PurchasesService {
    @Autowired
    private PurchasesMapper purchasesMapper;

    // 插入数据 调用entity包purchases.xml里的insertPurchases配置
    public void insert(Purchases purchases) {
        purchasesMapper.insert(  purchases);
    }

    // 更新数据 调用entity包purchases.xml里的updatePurchases配置
    public void update(Purchases purchases) {
        purchasesMapper.update(  purchases);
    }

    // 删除数据 调用entity包purchases.xml里的deletePurchases配置
    public void delete(String purchasesid) {
        purchasesMapper.delete(  purchasesid);
    }

    // 查询全部数据 调用entity包purchases.xml里的getAllPurchases配置
    public List<Purchases> getAll(Map<String, Object> params) {
        return purchasesMapper.getAll( params);
    }
    // 查询总行数 调用entity包Purchases.xml里的配置
    public int getRowSize(Map<String, Object> params) {
        return purchasesMapper.getRowSize( params);
    }




    // 按照类里面的值精确查询 调用entity包purchases.xml里的getPurchasesByCond配置
    public List<Purchases> getByCond(Purchases purchases) {
        return purchasesMapper.getByCond(  purchases);
    }

    // 按照Purchases类里面的值模糊查询 调用entity包purchases.xml里的getPurchasesByLike配置
    public List<Purchases> getByLike(Purchases purchases) {
        return purchasesMapper.getByLike(  purchases);
    }

    // 按主键查询表返回单一的Purchases实例 调用entity包purchases.xml里的getPurchasesById配置
    public Purchases getById(String purchasesid) {
        return purchasesMapper.getById(  purchasesid);
    }



    /* <!--获取预约单价成功的数量-->*/
    public  int getPurchasesNumber(int thinginfoid)  {
        return purchasesMapper.getPurchasesNumber( thinginfoid);
    }

}
