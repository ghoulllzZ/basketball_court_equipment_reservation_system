package com.mapper;

import com.entity.Members;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
//需要注意，这里没有配置mapper接口扫描包，因此我们需要给每一个Mapper接口添加@Mapper注解，才能被识别。
@Mapper

public interface  MembersMapper {
// 插入数据 调用entity包members.xml里的insertMembers配置
    void insert(Members members) ;

    // 更新数据 调用entity包members.xml里的updateMembers配置
    void update(Members members) ;

    // 删除数据 调用entity包members.xml里的deleteMembers配置
    void delete(String membersid) ;

    // 查询全部数据 调用entity包members.xml里的getAllMembers配置
    List<Members> getAll(Map<String, Object> params) ;



    // 查询总行数 调用entity包Members.xml里的配置
    int getRowSize(Map<String, Object> params);





    // 按照类里面的值精确查询 调用entity包members.xml里的getMembersByCond配置
    List<Members> getByCond(Members members) ;



    // 按照Members类里面的值模糊查询 调用entity包members.xml里的getMembersByLike配置
    List<Members> getByLike(Members members);

    // 按主键查询表返回单一的Members实例 调用entity包members.xml里的getMembersById配置
    Members getById(String membersid);

}
