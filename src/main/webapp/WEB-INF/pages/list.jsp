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
    <script type="text/javascript" src="../static/jquery/jQuery.js"></script>
    <link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">

                <tr>
                    <td>id</td>
                    <td>lastName</td>
                    <td>email</td>
                    <td>gender</td>
                    <td>department</td>
                    <td>操作</td>

                </tr>
                <tr>
                    <td>1</td>
                    <td>lastName</td>
                    <td>email@email.com</td>
                    <td>M</td>
                    <td>3</td>
                    <td>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除</button>
                    </td>

                </tr>
                <c:forEach items="${allEmps}" var="employee">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.lastName}</td>
                        <td>${employee.email}</td>
                        <td>${employee.gender}</td>
                        <td>${employee.deptId}</td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>
    <div class="row">
        <div class="col-md-6">页面详情信息</div>
        <div class="col-md-6 col-md-offset-6">
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
    </div>
</div>






<%---------------------------%>


</body>
</html>
