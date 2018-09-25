package com.mazexiang.service;

import com.mazexiang.bean.Department;
import com.mazexiang.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;
    public List<Department> findDepartments(){
        return departmentMapper.selectByExample(null);
    }

 }
