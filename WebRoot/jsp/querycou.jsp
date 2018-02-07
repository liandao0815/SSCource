<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>课程列表</title>
<link rel="stylesheet" href="/sscource/css/bootstrap.css">
<script src="/sscource/js/jquery.js"></script>
<script src="/sscource/js/bootstrap.js"></script>
<style>
    .contain{width: 100%;margin: 50px auto;text-align: center;}
    .title{font-family: STkaiti;}
    .a{font-size: 30px;font-family: STkaiti; }
    .a:hover{text-decoration: none; }
    .table{width: 1200px !important;margin: 30px auto;color: #888; }
    th,td{text-align: center; }
</style>
</head>
<body>
    <div class="contain">
        <h1 class="title">课程列表</h1>
        <table class="table">
            <tr>
            	<th>课程号</th>
                <th>课程名字</th>
                <th>课程学分</th>
                <th>授课教师</th>
                <th>授课人数</th>
                <th>剩余人数</th>
            </tr>
            <c:forEach var="list" items="${list}">
	            <tr>
	            	<td>${list.cid}</td>
	            	<td>${list.name}</td>
	            	<td>${list.credit}</td>
	            	<td>${list.teacher}</td>
	            	<td>${list.couCount}</td>
	            	<td>${list.couCount - list.stuCount}</td>
            	</tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>