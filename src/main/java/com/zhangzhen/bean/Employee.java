package com.zhangzhen.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^[0-9a-zA-Z_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "后台参数校验失败,用户名为2-5位汉子或6-16位数字字母下划线")
    private String empName;

    private String gender;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "邮箱格式校验失败")
    private String enail;

    private Integer dId;

    private DepartMent departMent;

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gender, String enail, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.enail = enail;
        this.dId = dId;
    }

    public DepartMent getDepartMent() {
        return departMent;
    }

    public void setDepartMent(DepartMent departMent) {
        this.departMent = departMent;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEnail() {
        return enail;
    }

    public void setEnail(String enail) {
        this.enail = enail == null ? null : enail.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", enail='" + enail + '\'' +
                ", dId=" + dId +
                ", departMent=" + departMent +
                '}';
    }
}