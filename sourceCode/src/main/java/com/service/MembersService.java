package com.service;

import com.entity.Members;
import com.mapper.MembersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service

public class MembersService {
    @Autowired
    private MembersMapper membersMapper;

    // 插入数据 调用entity包members.xml里的insertMembers配置
    public void insert(Members members) {
        membersMapper.insert(  members);
    }

    // 更新数据 调用entity包members.xml里的updateMembers配置
    public void update(Members members) {
        membersMapper.update(  members);
    }

    // 删除数据 调用entity包members.xml里的deleteMembers配置
    public void delete(String membersid) {
        membersMapper.delete(  membersid);
    }

    // 查询全部数据 调用entity包members.xml里的getAllMembers配置
    public List<Members> getAll(Map<String, Object> params) {
        return membersMapper.getAll( params);
    }



    // 查询总行数 调用entity包Members.xml里的配置
    public int getRowSize(Map<String, Object> params) {
        return membersMapper.getRowSize( params);
    }





    // 按照类里面的值精确查询 调用entity包members.xml里的getMembersByCond配置
    public List<Members> getByCond(Members members) {
        return membersMapper.getByCond(  members);
    }



    // 按照Members类里面的值模糊查询 调用entity包members.xml里的getMembersByLike配置
    public List<Members> getByLike(Members members) {
        return membersMapper.getByLike(  members);
    }

    // 按主键查询表返回单一的Members实例 调用entity包members.xml里的getMembersById配置
    public Members getById(String membersid) {
        return membersMapper.getById(  membersid);
    }

}
