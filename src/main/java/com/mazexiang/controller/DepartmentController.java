package com.mazexiang.controller;

import com.mazexiang.bean.Department;
import com.mazexiang.bean.Message;
import com.mazexiang.service.DepartmentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ssm")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;


    @RequestMapping("/queryDept")
    @ResponseBody
    public Message findAllDept(){
        List<Department> departments = departmentService.findDepartments();
        return Message.success().add("allDept",departments);
    }

}
