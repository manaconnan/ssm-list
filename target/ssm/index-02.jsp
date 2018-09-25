<%--
  Created by IntelliJ IDEA.
  User: mazexiang
  Date: 2017/9/11
  Time: 上午11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Index</title>
    <script type="text/javascript" src="static/jquery/jQuery.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkText(){
            var str = form1.inputName.value;
            if(str==""){
                alert("请输入姓名") ;
            }
            else {
                alert(" 谢谢");
            }

        }

    </script>

</head>
<body>
<h2> hello world</h2><br>
<form method="post" action="/query">
<button class="btn btn-success" >查询所有员工 </button>
</form>
<br>
<a href="/ssm/queryWeb" > 查询所有员工</a>
<br>
<a href="queryDepts">查询所有部门信息</a>
<br>
<a href="insertOneEmployee">新增一个员工</a>
<br>
<a href="insertByBatch">批量新增</a>
<form name="form1" action="/MyFilter" method="post">
    <input name="inputName" type="text" >
    <br>
    <input type="button" class="btn btn-success" name="button1" onclick="checkText()" value="检测">
</form>

您是第&nbsp;<%=session.getAttribute("count")%> 位访客

<%@ include file="WEB-INF/pageTest/copyRight.jsp"%>
</body>
</html>
