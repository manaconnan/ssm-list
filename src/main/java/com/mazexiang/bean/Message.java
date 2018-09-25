package com.mazexiang.bean;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 */


public class Message {
    //状态码： 成功-100， 失败-200
    private int code;
    private String msg;

    // 实际要返回给浏览器的有效数据都放在这个map里面
    private Map<String,Object>  extendMap = new HashMap<String, Object>();

    public static Message success(){
        Message result = new Message();
        result.setCode(100);
        result.setMsg("操作成功");
        return result;
    }

    public static Message failed(){
        Message result = new Message();
        result.setCode(200);
        result.setMsg("操作失败");
        return result;
    }
    public Message add(String key, Object value){
        this.getExtendMap().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtendMap() {
        return extendMap;
    }

    public void setExtendMap(Map<String, Object> extendMap) {
        this.extendMap = extendMap;
    }
}
