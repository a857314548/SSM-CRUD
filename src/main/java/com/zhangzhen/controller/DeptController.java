package com.zhangzhen.controller;

import com.zhangzhen.bean.DepartMent;
import com.zhangzhen.bean.ResponseMsg;
import com.zhangzhen.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping(path = "/getDepts")
    @ResponseBody
    public ResponseMsg getDepts() {
        List<DepartMent> departMentList =  deptService.getDempt();
        return ResponseMsg.success().setRecod("record",departMentList);
    }
}
