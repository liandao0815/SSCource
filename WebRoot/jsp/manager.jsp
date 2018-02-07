<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<title>管理员系统</title>
<link rel="stylesheet" href="/sscource/css/bootstrap.css">
<script src="/sscource/js/chart.js"></script>
<script src="/sscource/js/jquery.js"></script>
<script src="/sscource/js/bootstrap.js"></script>
<style>
    .contain{width: 80%;margin: 50px auto;text-align: center;}
    .title{font-family: STkaiti;}
    #myTab{margin: 30px auto;width: 1000px; }
    #myTab li{margin-left: 40px; }
    #myTab li a{font-size: 18px;}
    .courceul{display: flex;flex-direction: column;width: 130px;margin-left: 50px; }
    .studentul{display: flex;flex-direction: column;width: 200px;margin-left: 50px;margin-top: 100px; }
    .courceul li,.studentul li{list-style: none;margin-top: 50px; }
    .courceul li a,.studentul li a,.infoul li a{color: brown;font-size: 20px;font-family: STkaiti; }
    .infoul{display: flex;width: 500px;justify-content: space-around;margin: 0 auto; }
    #course,#student{position: relative; }
    #coursetab{position: absolute;top: 0px;width: 600px;left: 50%;margin-left: -300px; }
    #studenttab{position: absolute;top: -36px;width: 600px;left: 50%;margin-left: -300px; }
    .form{width: 300px;margin: 0 auto;margin-top: 30px;	}
    .form-control{margin-bottom: 16px; }
    .lbtn{width: 280px;display: flex;justify-content: space-around;margin: 20px auto; }
	.lbtn .btn{width: 100px; }
    #deleteStu,#delete{margin-top: 80px; }
    .size{width:430px;height:430px;margin: 0 auto; }
</style>
</head>
<body>
    <div class="contain">
        <h1 class="title">欢迎您，管理员!</h1>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#course" data-toggle="tab">课程管理</a></li>
            <li><a href="#student" data-toggle="tab">学生管理</a></li>
            <li><a href="#info" data-toggle="tab">信息统计</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="course">
                <ul class="courceul nav">
                    <li><a href="#create" data-toggle="tab" class="active">新增课程</a></li>
                    <li><a href="#delete" data-toggle="tab">删除课程</a></li>
                    <li><a href="#update" data-toggle="tab">更新课程</a></li>
                    <li><a href="#query" data-toggle="tab">查询课程</a></li>
                </ul>
                <div id="coursetab" class="tab-content">
                    <div class="tab-pane fade  in active" id="create">
                        <h3 class="title">新增课程</h3>
                        <s:form action="addCourse" namespace="/" method="post" class="form">
                            <input type="text" name="cid" placeholder="课程号" class="form-control" >
                            <input type="text" name="name" placeholder="课程名称" class="form-control" >
                            <input type="text" name="credit" placeholder="课程学分" class="form-control" >
                            <input type="text" name="teacher" placeholder="授课教师" class="form-control" >
                            <input type="text" name="couCount" placeholder="授课人数" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">保存</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form>
                    </div>
                    <div class="tab-pane fade" id="delete">
                        <h3 class="title">删除课程</h3>
                        <s:form action="deleteCourse" namespace="/" method="post" class="form">
                            <input type="text" name="cid" placeholder="课程号" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">删除</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form> 
                    </div>
                    <div class="tab-pane fade" id="update">
                        <h3 class="title">更新课程</h3>
                        <s:form action="updateCourse" namespace="/" method="post" class="form">
                            <input type="text" name="cid" placeholder="课程号" class="form-control" >
                            <input type="text" name="name" placeholder="课程名称" class="form-control" >
                            <input type="text" name="credit" placeholder="课程学分" class="form-control" >
                            <input type="text" name="teacher" placeholder="授课教师" class="form-control" >
                            <input type="text" name="couCount" placeholder="授课人数" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">更新</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form> 
                    </div>
                    <div class="tab-pane fade" id="query">
                        <h3 class="title">查询课程</h3>
                        <s:form action="queryCourse" namespace="/" method="post" class="form">
                            <input type="text" name="cid" placeholder="课程号" class="form-control" >
                            <input type="text" name="name" placeholder="课程名称" class="form-control" >
                            <input type="text" name="credit" placeholder="课程学分" class="form-control" >
                            <input type="text" name="teacher" placeholder="授课教师" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">查询</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form> 
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="student">
                <ul class="studentul nav">
                    <li><a href="#createStu" data-toggle="tab" class="active">录入学生信息</a></li>
                    <li><a href="#deleteStu" data-toggle="tab">删除学生信息</a></li>
                </ul>
                <div id="studenttab" class="tab-content">
                    <div class="tab-pane fade  in active" id="createStu">
                        <h3 class="title">录入学生信息</h3>
                        <s:form action="addStudent" namespace="/" method="post" class="form">
                            <input type="text" name="sid" placeholder="学号" class="form-control" >
                            <input type="text" name="sname" placeholder="姓名" class="form-control" >
                            <input type="text" name="spassword" placeholder="密码" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">录入</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form>
                    </div>
                    <div class="tab-pane fade" id="deleteStu">
                        <h3 class="title">删除学生信息</h3>
                        <s:form action="deleteStudent" namespace="/" method="post" class="form">
                            <input type="text" name="sid" placeholder="学号" class="form-control" >
                            <div class="lbtn">
                                <button type="submit" class="btn btn-primary">删除</button>
                                <button type="reset" class="btn btn-primary">重置</button>
                            </div>
                        </s:form> 
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="info">
                <ul class="infoul nav">
                    <li><a href="#courseinfo" data-toggle="tab" class="active">课程类别统计</a></li>
                    <li><a href="#studentinfo" data-toggle="tab">选课人数统计</a></li>
                </ul>
                <div id="infotab" class="tab-content">
                    <div class="tab-pane fade  in active" id="courseinfo">
                        <div class="size">
                            <canvas id="myChart1" width="400" height="400"></canvas>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="studentinfo">
                        <div class="size">
                            <canvas id="myChart2" width="400" height="400"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function randomColor() {
    		var r=Math.floor(Math.random()*256);
            var g=Math.floor(Math.random()*256);
            var b=Math.floor(Math.random()*256);
            return "rgba("+r+','+g+','+b+',0.3'+")";;
    	}
    	$(function () {
    		$.getJSON('/sscource/ajaxInfo1.action',function(data){
                var name = [],couCount = [] ,backgroundColor = [];
    			for (let i = 0; i < data.length; i++) {
                    name.push(data[i].split('=')[0]);
                    couCount.push(data[i].split('=')[1])
                    backgroundColor.push(randomColor());
                }
                var ctx = $("#myChart1").get(0).getContext("2d");
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: name,
                        datasets: [{
                            label: '课程类别统计',
                            data: couCount,
                            backgroundColor
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
			})
			$.getJSON('/sscource/ajaxInfo2.action',function(data){
                var name = [],stuCount = [], backgroundColor = [];
                for (let i = 0; i < data.length; i++) {
                    name.push(data[i].split('=')[0]);
                    stuCount.push(data[i].split('=')[1]);
                    backgroundColor.push(randomColor());
                }
                var ctx = $("#myChart2").get(0).getContext("2d");
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: name,
                        datasets: [{
                            label: '选课人数统计',
                            data: stuCount,
                            backgroundColor
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
			})
    	})
    </script>
</body>
</html>