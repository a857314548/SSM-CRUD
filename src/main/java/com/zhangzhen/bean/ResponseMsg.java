package com.zhangzhen.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResponseMsg {
    private Integer code;

    private String msg;

    private Map<String,Object> record = new HashMap<>();

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getRecord() {
        return record;
    }

    public void setRecord(Map<String, Object> record) {
        this.record = record;
    }

    public static ResponseMsg success() {
        ResponseMsg responseMsg = new ResponseMsg();
        responseMsg.setCode(100);
        responseMsg.setMsg("成功");
        return responseMsg;
    }

    public static ResponseMsg fail() {
        ResponseMsg responseMsg = new ResponseMsg();
        responseMsg.setCode(200);
        responseMsg.setMsg("失败");
        return responseMsg;
    }

    public ResponseMsg setRecod(String key,Object value) {
        this.getRecord().put(key,value);
        return this;
    }

    @Override
    public String toString() {
        return "ResponseMsg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", record=" + record +
                '}';
    }
}
