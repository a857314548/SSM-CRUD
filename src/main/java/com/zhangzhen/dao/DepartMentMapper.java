package com.zhangzhen.dao;

import com.zhangzhen.bean.DepartMent;
import com.zhangzhen.bean.DepartMentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartMentMapper {
    long countByExample(DepartMentExample example);

    int deleteByExample(DepartMentExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(DepartMent record);

    int insertSelective(DepartMent record);

    List<DepartMent> selectByExample(DepartMentExample example);

    DepartMent selectByPrimaryKey(Integer deptId);

    int updateByExampleSelective(@Param("record") DepartMent record, @Param("example") DepartMentExample example);

    int updateByExample(@Param("record") DepartMent record, @Param("example") DepartMentExample example);

    int updateByPrimaryKeySelective(DepartMent record);

    int updateByPrimaryKey(DepartMent record);
}