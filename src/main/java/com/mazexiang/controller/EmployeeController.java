package com.mazexiang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mazexiang.bean.Department;
import com.mazexiang.bean.Employee;
import com.mazexiang.bean.Message;
import com.mazexiang.dao.EmployeeMapper;
import com.mazexiang.service.DepartmentService;
import com.mazexiang.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/ssm")
public class EmployeeController {
    Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private SqlSession sqlSession;
    @RequestMapping(value = "/getEmp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getEmployee(@PathVariable("id") Integer id){
        logger.info("delete called [{}] == ",id);
        Employee employee= employeeService.getEmployee(id);
        return Message.success().add("employee",employee);
    }

    @RequestMapping(value = "/deleteEmp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteEmployee(@PathVariable("ids") String ids) {
        logger.info("=====delete start=====");
        System.out.println("-------------------------------------------------------");
        System.out.println("============>ids的值是： " + ids);
        if (ids.contains("-")){
            List<Integer> str= new ArrayList<>();
            String[] split_ids = ids.split("-");
            for (String string:split_ids){
                Integer i = Integer.parseInt(string);
                str.add(i);
            }
            employeeService.deleteEmpBatch(str);
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);

        }
        return Message.success();
    }
    @RequestMapping(value = "/editEmp/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Message editEmployee(Employee employee){
        employeeService.editEmployee(employee);
        return Message.success();
    }

    @RequestMapping(value = "/addEmp",method = RequestMethod.POST)
    @ResponseBody
    public Message addEmployee(@Valid Employee employee, BindingResult result){

        if(result.hasErrors()){
            Map<String,Object> errorMap = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError: fieldErrors) {
                    System.out.println("-------------------------------------------------------");
                    System.out.println("============>错误的字段名 " +fieldError.getField() );
                    errorMap.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Message.failed().add("errorMap",errorMap);
        }else {

            employeeService.insertEmployee(employee);
            logger.info("=====delete end=====");
            return Message.success();
        }
    }

    @RequestMapping("/query")
    @ResponseBody  //这个注解要正常使用的话，需要导入Jackson包， 函数返回json字符串
    public Message getEmployeesWithJson (@RequestParam(value = "pn",defaultValue = "1") Integer pn){
       logger.info("=====query start query all 1103=====");
       long startTime = System.currentTimeMillis();
        PageHelper.startPage(pn,5);
        List<Employee> allEmployees = employeeService.findAllEmployees();
          //紧跟的这个查询就是一个分页查询
        //使用paginfo来包装查询后的结果，只需要将pageinfo交给页面就行了，封装了详细分页信息，和查询的信息
        //传入要联系显示的页数：5
        PageInfo pageInfo = new PageInfo(allEmployees,5);

        logger.error("=======test error=====");

        long endTime=System.currentTimeMillis();
        logger.debug("costTime:[{}]",endTime-startTime);
        System.out.println("====> 时间" + (endTime-startTime));
        logger.info("======query end======");
        return Message.success().add("pageinfo",pageInfo);
    }

   //@RequestMapping("/query")
    public String findEmployees(@RequestParam(value = "pn",defaultValue = "1") Integer pn ,
                                Model model){


        PageHelper.startPage(pn,5);
        List<Employee> allEmployees = employeeService.findAllEmployees(); //紧跟的这个查询就是一个分页查询
        //使用paginfo来包装查询后的结果，只需要将pageinfo交给页面就行了，封装了详细分页信息，和查询的信息
        //传入要联系显示的页数：5
        PageInfo pageInfo = new PageInfo(allEmployees,5);

        model.addAttribute("allEmps",pageInfo);
        return "list";
    }


@RequestMapping("/queryWeb")
public String findEmployees(Map<String,Object> map){

    List<Employee> allEmployees = employeeService.findAllEmployees();

    map.put("allEmps",allEmployees);
    return "list";
}

    @RequestMapping("/insertOneEmployee")
    public String insertOneEmployee(){
       Employee employee= new Employee(null,"xiaohong2","1","xiaohong@123.com",3);
        employeeService.insertEmployee(employee);
        return "success";
    }

/**  批量操作的函数
    @RequestMapping("/insertByBatch")
    public String insertBatch(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);

        for (int i = 0;i<1000;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insert(new Employee(null,uid,"M",uid+"@126.com",1));
        }

        return "success";
    }
  */
}
