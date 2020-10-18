package com.zhangzhen.bean;

public class Employee1 {
    private int empId;

    private String EmpName;

    private String gender;

    private String email;

    private int dId;

    public Employee1() {
    }

    public Employee1(int empId, String empName, String gender, String email, int dId) {
        this.empId = empId;
        EmpName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return EmpName;
    }

    public void setEmpName(String empName) {
        EmpName = empName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", EmpName='" + EmpName + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                '}';
    }
}
