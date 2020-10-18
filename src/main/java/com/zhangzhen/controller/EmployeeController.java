package com.zhangzhen.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.javafx.collections.MappingChange;
import com.zhangzhen.bean.Employee;
import com.zhangzhen.bean.ResponseMsg;
import com.zhangzhen.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {


    @Autowired
    EmployeeService employeeService;

    @DeleteMapping(path = "/emp/{empId}")
    @ResponseBody
    public ResponseMsg deleteEmp(@PathVariable(name = "empId") String ids) {
        System.out.println("测试"+ids);
        if (ids.contains("-")) {
            List<Integer> idList = new ArrayList<>();
            String[] idArr = ids.split("-");
            for (String str : idArr) {
                idList.add(Integer.parseInt(str));
            }
            System.out.println("测试:"+idList);
            employeeService.deleteByIdArr(idList);
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }

        return ResponseMsg.success();
    }

    @PutMapping(path = "/emp/{empId}")
    @ResponseBody
    public ResponseMsg updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return ResponseMsg.success();
    }

    @GetMapping(path = "/emp/{eId}")
    @ResponseBody
    public ResponseMsg getEmp(@PathVariable(name = "eId") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return ResponseMsg.success().setRecod("emp",employee);
    }

    @PostMapping(path = "/checkUser")
    @ResponseBody
    public ResponseMsg checkUser(@RequestParam("empName")String userName) {
        //与前台校验保持一致
        String regStr = "(^[0-9a-zA-Z_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        boolean matches = userName.matches(regStr);
        if (!matches) {
            return ResponseMsg.fail().setRecod("check_user","在后台校验失败,用户名为2-5位汉字或6-16位字母数字下划线");
        }
        boolean isFlag = employeeService.checkUser(userName);
        if (isFlag) {
            return ResponseMsg.success();
        } else {
            return ResponseMsg.fail().setRecod("check_user","用户名不可用");
        }
    }

    @PostMapping(value = "/emps")
    @ResponseBody
    public ResponseMsg addEmp(@Valid Employee employee,BindingResult bindingResult) {
        Map<String,Object> map = new HashMap<>();
        if (bindingResult.hasErrors()) {
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                String filedId = fieldError.getField();
                String errorMsg = fieldError.getDefaultMessage();
                map.put(filedId,errorMsg);
            }
            return ResponseMsg.fail().setRecod("hib_vali",map);
        } else {
            employeeService.addEmp(employee);
            return ResponseMsg.success();
        }
    }

    @RequestMapping(value = "/emps")
    @ResponseBody
    public ResponseMsg getEmpsWithJson(@RequestParam(name = "pn",defaultValue = "1")Integer pn) {
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps,5);
        return ResponseMsg.success().setRecod("pageInfo",pageInfo);
    }


    //@RequestMapping(path = "/emps")
    public String getEmps(@RequestParam(name = "pn",defaultValue = "1") Integer p, Model model) {

        PageHelper.startPage(p,5);
        System.out.println("p==============>"+p);
        List<Employee> emps = employeeService.getAll();
        //System.out.println("pn:"+pn);
        //System.out.println(emps);
        PageInfo pageInfo = new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
