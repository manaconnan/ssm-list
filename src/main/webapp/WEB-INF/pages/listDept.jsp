<%--
  Created by IntelliJ IDEA.
  User: mazexiang
  Date: 2017/9/12
  Time: 下午1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>部门列表</title>
</head>
<body>
<table border="1" cellpadding="10" cellspacing="0">

    <tr>
        <td>id</td>
        <td>department</td>

    </tr>
    <c:forEach items="${allDepts}" var="dept">
        <tr>
            <td>${dept.id}</td>
            <td>${dept.departmentname}</td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
