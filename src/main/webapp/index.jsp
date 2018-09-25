<%--
  Created by IntelliJ IDEA.
  User: mazexiang
  Date: 2017/9/11
  Time: 下午12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表 </title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jQuery.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>SSM_CRUD</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary"id="add_modol_btn" >新增</button>
            <button class="btn btn-danger" id="delete_modol_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="empTable" class="table table-striped">
            <thead>
                <tr>
                    <td>
                        <input type="checkbox"  id="checkbox_all">
                    </td>
                    <td>id</td>
                    <td>lastName</td>
                    <td>email</td>
                    <td>gender</td>
                    <td>department</td>
                    <td>操作</td>

                </tr>
            </thead>
            <tbody>

            </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info"></div>
        <div class="col-md-6" id="page_nav"></div>


    </div>
</div>
<%------------ 新增员工的模态框---------------%>

<div class="modal fade" id="addEmpModol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group" id="inputName">
                        <label for="inputName3" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="lastName" class="form-control" id="inputName3" placeholder="name">
                        </div>
                        <button type="button" id="valid1" class="btn btn-default col-sm-1">校验</button>
                    </div>
                    <div class="form-group" id="inputemail0">
                        <label for="inputemail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" id="inputemail" placeholder="email@mazexiang.com">
                        </div>
                        <button type="button" id="valid2" class="btn btn-default col-sm-1">校验</button>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                         <label class="radio-inline">
                            <input type="radio" name="gender" id="inlineRadio1" value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门信息</label>
                        <div class="col-sm-4">
                            <%--部门提交部门ID--%>
                            <select class="form-control" id="dept_control" name="deptId">
                                <%--<option>1</option>--%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="save_btn" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<%---------------------------%>
<%------------ 修改员工的模态框---------------%>

<div class="modal fade" id="UpdateEmpModol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">编辑员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="update_name_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="update_email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender"  value="M" id="radio_male" > 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender"  value="F" id="radio_famale"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门信息</label>
                        <div class="col-sm-4">
                            <%--部门提交部门ID--%>
                            <select class="form-control" id="update_dept_control" name="deptId">
                                <%--<option>1</option>--%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="update_btn" class="btn btn-primary">更新</button>
            </div>
        </div>
    </div>
</div>
<%---------------------------%>
<script type="text/javascript">

    var totalRecord,currentPage;
    //1、页面加载完成后，直接发送ajax请求，获得分页数据

    $(function () {
       goto_page(1);
        
        $("#add_modol_btn").click(function () {
            $("#inputName").removeClass("has-error has-success");
            $("#inputemail0").removeClass("has-error has-success");

            //获得所有部门信息
             get_AllDept("#dept_control");
            $("#addEmpModol").modal({
                backdrop:"static"
            });
        });
        $("#save_btn").click(function () {
            $("#inputName").removeClass("has-error has-success");
            $.ajax({
                url:"${pageContext.request.contextPath}/ssm/addEmp",
                type:"POST",
                data:$("#addEmpModol form").serialize(),//这是jquery提供的将表单序列化的方法，否则手动拼接表单信息到data
                success:function (result) {

                    if (result.code == 100) {
                        show_valid_msg("#inputName","success");
                        $("#addEmpModol").modal('hide');
                        goto_page(totalRecord);
                    }else {
                        console.log(result);
                        show_valid_msg("#inputName","error");
                    }
                }
            });

        });

    });
    $("#valid2").click(function () {
        $("#inputemail0").removeClass("has-error has-success");
        $.ajax({
            url:"${pageContext.request.contextPath}/ssm/addEmp",
            type:"POST",
            data:$("#addEmpModol form").serialize(),//这是jquery提供的将表单序列化的方法，否则手动拼接表单信息到data
            success:function (result) {

                if (result.code == 100) {
                    show_valid_msg("#inputemail0","success","邮箱可用");
                }else {
                    console.log(result);
                    show_valid_msg("#inputemail0","error","邮箱不可用");
                }
            }
        });

    });
    function show_valid_msg(ele,flag,msg) {
        if("error"==flag) {
            $(ele).addClass("has-error");
            $($("<span></span>").text(msg)).appendTo(ele);


        }
        if("success"==flag){
            $(ele).addClass("has-success");
            $($("<span></span>").text(msg)).appendTo(ele);
        }

    }


    
    function get_AllDept(modolEle) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ssm/queryDept",
            type:"GET",
            success:function (result) {
                show_dept_in_modol(result,modolEle);
            }
        });
    }
    function show_dept_in_modol(result,modolEle) {
        $(modolEle).empty();
        var depts= result.extendMap.allDept;
        //另一种遍历写法
        $.each(depts, function () {
            $(modolEle).append($("<option></option>").append(this.departmentname).attr("value",this.id));
        });

    }

    function goto_page(pn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ssm/query",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //  console.log(result);
                //result里面包含了返回的json数据
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        $("#empTable tbody").empty();
        var thispage = result.extendMap.pageinfo.pageNum;
        var emps = result.extendMap.pageinfo.list;
        $.each(emps,function (index,emp) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_box'></td>")
            var empIdTd=$("<td></td>").append(emp.id);
            var empNameTd = $("<td></td>").append(emp.lastName);
            var empGenderTd = $("<td></td>").append(emp.gender);
            var empEmailTd = $("<td></td>").append(emp.email);
            var empDeptTd = $("<td></td>").append(emp.deptId==2?"开发部":"测试部");
            /**
             *
             * <button class="btn btn-primary btn-sm">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>
             */
            var edtBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("删除");

            //为编辑和删除按钮添加一个自定义的唯一标示属性，以便于后续使用
            edtBtn.attr("editBtn_id",emp.id);
            delBtn.attr("deletBtn_id",emp.id);
            delBtn.click(function () {
                if(confirm("确认要删除【"+emp.lastName+"】吗？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/ssm/deleteEmp/"+emp.id,
                        type:"DELETE",
                        success:function (result) {
                            goto_page(currentPage);
                        }
                    });
                }

                goto_page(thispage);
            });

            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empEmailTd)
                .append(empGenderTd)
                .append(empDeptTd)
                .append(edtBtn)
                .append(delBtn)
                .appendTo("#empTable tbody");
        });
    }
    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append("当前为第 "+result.extendMap.pageinfo.pageNum+" 页，总共有"
            +result.extendMap.pageinfo.pages+" 页，总共"
            +result.extendMap.pageinfo.total+" 条记录");
        totalRecord=result.extendMap.pageinfo.pages;
        currentPage=result.extendMap.pageinfo.pageNum;
    }
    /**
     *  <div class="col-md-6 col-md-offset-6">
     <nav aria-label="Page navigation">
     <ul class="pagination">
     <li><a href="#">首页</a></li>
     <li>
     <a href="#" aria-label="Previous">
     <span aria-hidden="true">&laquo;</span>
     </a>
     </li>
     <li><a href="#">1</a></li>
     <li><a href="#">2</a></li>
     <li><a href="#">3</a></li>
     <li><a href="#">4</a></li>
     <li><a href="#">5</a></li>
     <li>
     <a href="#" aria-label="Next">
     <span aria-hidden="true">&raquo;</span>
     </a>
     </li>
     <li><a href="#">末页</a></li>
     </ul>
     </nav>
     </div>
     * @param result
     */
    function build_page_nav(result) {
        $("#page_nav").empty();

        var ul = $("<ul></ul>").addClass("pagination")
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extendMap.pageinfo.hasPreviousPage==false){
           firstPageLi.addClass("disabled");
           prePageLi.addClass('disabled');
        }else{
            firstPageLi.click(function () {
                goto_page(1);
            });

            prePageLi.click(function () {
                goto_page(result.extendMap.pageinfo.pageNum-1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if(result.extendMap.pageinfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass('disabled');
        }else {
            lastPageLi.click(function () {
                goto_page(result.extendMap.pageinfo.pages);
            });
            nextPageLi.click(function () {
                goto_page(result.extendMap.pageinfo.pageNum+1);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extendMap.pageinfo.navigatepageNums,function (index,item) {
            var pagesLi =  $("<li></li>").append($("<a></a>").append(item));
            if(result.extendMap.pageinfo.pageNum==item){
                pagesLi.addClass("active");
            }
            pagesLi.click(function () {
                goto_page(item);
            });
            ul.append(pagesLi);
        } );
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }
    $(document).on("click",".edit_btn",function () {

        get_AllDept("#update_dept_control");
        get_employee_by_id($(this).attr("editBtn_id"));
        $("#update_btn").attr("emp_id",$(this).attr("editBtn_id"));
        $("#UpdateEmpModol").modal({
            backdrop:"static"
        });
    });

    function get_employee_by_id(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ssm/getEmp/"+id,
            type:"GET",
            success:function (result) {
                $("#update_name_static").text(result.extendMap.employee.lastName);
                // $("#update_email").attr("value",result.extendMap.employee.email);
                //给邮箱赋值，也可以写程
                $("#update_email").val(result.extendMap.employee.email);
                //点击时选中的单选框和复选框
                $("#updateempmodol input[name=gender]").val([result.extendMap.employee.gender]);
                $("#updateempmodol select").val([result.extendMap.employee.deptId]);
            }
        });
    }
    $("#update_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/ssm/editEmp/"+$(this).attr("emp_id"),
//            type:"POST",
//            data:$("#UpdateEmpModol form").serialize()+"&_method=PUT",//这是jquery提供的将表单序列化的方法，否则手动拼接表单信息到data
            type:"PUT",
            data:$("#UpdateEmpModol form").serialize(),
            success:function (result) {
                $("#UpdateEmpModol").modal('hide');
                goto_page(currentPage);
            }
        });
    });

    $("#checkbox_all").click(function () {
        $(".check_box").prop("checked",$(this).prop("checked"));
    });
    $("#delete_modol_btn").click(function () {
        var names="";
        var ids="";
        $.each($(".check_box:checked"),function () {
            names =names+ $(this).parents("tr").find("td:eq(2)").text()+",";
            ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        names=names.substring(0,names.length-1);
        ids=ids.substring(0,ids.length-1);
        if(confirm("确认要删除【"+names+"】吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/ssm/deleteEmp/"+ids,
                type:"DELETE",
                success:function (result) {
                    goto_page(currentPage);
                }
            });
        }

    });
</script>

</body>
</html>
