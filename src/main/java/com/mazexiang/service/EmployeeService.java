package com.mazexiang.service;

import com.mazexiang.bean.Employee;
import com.mazexiang.bean.EmployeeExample;
import com.mazexiang.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> findAllEmployees(){

        List<Employee> employees = employeeMapper.selectByExample(null);
        return  employees;
    }
    public void insertEmployee(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public void editEmployee(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
    public void deleteEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }
    public void deleteEmpBatch(List<Integer> ids){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        //sql=delete from  xxx where id in (1,2,3)
        criteria.andIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
    public Employee getEmployee(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }
}
