<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>学生选课系统</title>
<link rel="stylesheet" href="/sscource/css/bootstrap.css">
<script src="/sscource/js/jquery.js"></script>
<script src="/sscource/js/bootstrap.js"></script>
<style>
.contain {
	width: 100%;
	margin-top: 50px;
	text-align: center;
}

.form {
	width: 300px;
	margin: 0 auto;
	margin-top: 30px;
}

.title {
	font-family: STkaiti;
}

.form-control {
	margin-bottom: 16px;
}

#student, #manager {
	display: inline-block;
	margin-right: 20px;
	color: #888;
	font-size: 20px;
	font-family: STkaiti;
	cursor: pointer;
}

#student {
	color: #cc2e97;
}

.lbtn {
	width: 280px;
	display: flex;
	justify-content: space-around;
	margin: 20px auto;
}

.lbtn .btn {
	width: 100px;
}

.alink, .adiv {
	font-size: 20px;
	font-family: STxingkai;
}

.adiv {
	margin-top: 10px;
	font-family: STkaiti;
}

.alink:hover {
	text-decoration: none;
}

.table {
	width: 1200px !important;
	margin: 0 auto;
	color: #888;
}

th, td {
	text-align: center;
}

.caption {
	font-size: 24px;
	font-family: STkaiti;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${studentName.sname == null || studentName.sname == ''}">
			<div class="contain">
				<h1 class="title">欢迎来到学生选课系统</h1>
				<s:form action="studentlogin" namespace="/" method="post"
					class="form">
					<input type="text" name="sid" placeholder="请输入学号"
						class="form-control" id="id" autofocus autocomplete="off">
					<input type="password" name="spassword" placeholder="请输入密码"
						class="form-control" id="name">
					<span id="student">学生</span>
					<span id="manager">管理员</span>
					<div class="lbtn">
						<button type="submit" class="btn btn-primary">登录</button>
						<button type="reset" class="btn btn-primary">重置</button>
					</div>
				</s:form>
			</div>
			<script>
				$(function() {
					$('#student').click(
							function() {
								$('#student').css('color', '#cc2e97');
								$('#manager').css('color', '#888');
								$('.form').attr('action',
										'/sscource/studentlogin.action');
								$('#id').attr({
									'name' : 'sid',
									'placeholder' : '请输入学号'
								}).focus();
								$('#name').attr({
									'name' : 'spassword',
									'placeholder' : '请输入密码'
								});
							})
					$('#manager').click(
							function() {
								$('#manager').css('color', '#cc2e97');
								$('#student').css('color', '#888');
								$('.form').attr('action',
										'/sscource/managerlogin.action');
								$('#id').attr({
									'name' : 'mname',
									'placeholder' : '管理员账号'
								}).focus();
								$('#name').attr({
									'name' : 'mpassword',
									'placeholder' : '管理员密码'
								});
							})
				})
			</script>
		</c:when>
		<c:otherwise>
			<div class="contain">
				<h1 class="title">欢迎您，${studentName.sname}</h1>
				<a href="/sscource/jsp/updatestu.jsp" class="alink">修改资料</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/sscource/queryCourse.action" class="alink">浏览课程</a>
				<div class="adiv">已选课程(限选3门)：${course}</div>
				<div class="adiv">已选课程分数(限总学分5分)：${totalCredit}分</div>
				<table class="table">
					<caption class="caption">选择课程</caption>
					<tr>
						<th>课程名字</th>
						<th>课程学分</th>
						<th>授课教师</th>
						<th>授课人数</th>
						<th>剩余人数</th>
						<th>选择课程</th>
					</tr>
					<c:forEach var="list" items="${allList}">
						<tr>
							<td>${list.name}</td>
							<td>${list.credit}</td>
							<td>${list.teacher}</td>
							<td>${list.couCount}</td>
							<td>${list.couCount - list.stuCount}</td>
							<td><a href="${pageContext.request.contextPath}/selectCourse.action?sid=${studentName.sid}&cid=${list.cid}">选择</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<script>
				$(function () {
					$.getJSON('/sscource/ajaxInfo1.action',function(data){
						console.log(data);
					})
				})
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>