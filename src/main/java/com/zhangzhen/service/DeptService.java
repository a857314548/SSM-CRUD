package com.zhangzhen.service;

import com.zhangzhen.bean.DepartMent;
import com.zhangzhen.dao.DepartMentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    private DepartMentMapper departMentMapper;

    public List<DepartMent> getDempt() {
        List<DepartMent> departMentList = departMentMapper.selectByExample(null);
        return departMentList;
    }
}
