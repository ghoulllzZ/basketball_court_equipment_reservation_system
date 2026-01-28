package com.service;

import com.entity.Manager;
import com.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    // 插入数据 调用dAO里的insertManager配置
    public void insert(Manager manager) {
          managerMapper.insert(  manager);
    }

    // 更新数据 调用dAO里的updateManager配置
    public void update(Manager manager) {
        managerMapper.update(  manager);
    }

    // 删除数据 调用dAO里的deleteManager配置
    public void delete(String managerid) {
        managerMapper.delete(  managerid);
    }

    // 查询全部数据 调用dAO里的getAllManager配置
    public List<Manager> getAll(Map<String, Object> params) {
        return managerMapper.getAll( params);
    }

    // 查询总行数 调用dAO里的配置
    public int getRowSize(Map<String, Object> params) {
        return managerMapper.getRowSize( params);
    }






    // 按照类里面的值精确查询 调用dAO里的getManagerByCond配置
    public List<Manager> getByCond(Manager manager) {
        return managerMapper.getByCond(  manager);
    }

    // 按照类里面的值模糊查询 调用dAO里的getManagerByLike配置
    public List<Manager> getByLike(Manager manager) {
        return managerMapper.getByLike( manager);
    }

    // 按主键查询表返回单一的Manager实例 调用dAO里的getManagerById配置
    public Manager getById(String managerid) {
        return managerMapper.getById( managerid);
    }




}
