<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<title>个人资料</title>
<link rel="stylesheet" href="/sscource/css/bootstrap.css">
<script src="/sscource/js/jquery.js"></script>
<script src="/sscource/js/bootstrap.js"></script>
<style>
   .contain{width: 100%;margin-top: 50px;text-align: center;}
   .form{width: 300px;margin: 0 auto;margin-top: 30px;	}
   .title{font-family: STkaiti;}
   .form-control{margin-bottom: 16px; }
   .lbtn{width: 280px;display: flex;justify-content: space-around;margin: 20px auto; }
   .lbtn .btn{width: 100px; }
</style>
</head>
<body>
    <div class="contain">
        <h1 class="title">修改个人资料</h1>
        <s:form action="updateStudent" namespace="/" method="post" class="form">
            <input type="hidden" name="sid" value="${studentName.sid}">
            <input type="text" name="spassword" placeholder="密码" class="form-control">
            <input type="text" name="sname" placeholder="姓名" class="form-control">
            <input type="text" name="sex" placeholder="性别" class="form-control">
            <input type="text" name="age" placeholder="年龄" class="form-control">
            <input type="text" name="academy" placeholder="学院" class="form-control">
			<div class="lbtn">
				<button type="submit" class="btn btn-primary">修改</button>
				<button type="reset" class="btn btn-primary">重置</button>
			</div>
		</s:form>
    </div>
</body>
</html>