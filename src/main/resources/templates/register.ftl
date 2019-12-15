<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生注册页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link rel="stylesheet" href="stylehtml/css/register.css"/>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>


</head>
<body>
<div class="container">
        <#include "top.ftl">
<#--获取摄像头区域-->

<div id="seccound">
    <div class="zhuce_body">
        <div class="zhuce_kong">
            <div class="zc">
                <div class="bj_right">
                    <div id="re-left" >
                        <h3>面部信息采集</h3>
                        <div id="mainDiv" >
                            <video id='video' width='100%' height='100%' autoplay='autoplay'>
                            </video>
                            <canvas id='canvas' width='250px' height='250px' style='display: none'>
                            </canvas>
                        </div>
                    </div>
                </div>
                <div class="bj_bai">
                    <h3>欢迎注册</h3>
                        <form id="registerStuInfo"  method="post" name="form">
                            <span id="spanInStuId"></span>
                            <input id="inStuId" type="text" class="kuang_txt inStuId" name="inStuId" lay-verify="title" autocomplete="off" placeholder="请输入学号">
                            <span id="spanInStuPassword"></span>
                            <input id="inStuPassword" type="password" class="kuang_txt inStuPassword" name="inStuPassword" lay-verify="title" autocomplete="off" placeholder="请输入密码"><br>
                            <span id="spanInStuName"></span>
                            <input id="inStuName" type="text" class="kuang_txt" name="inStuName" lay-verify="title" autocomplete="off" placeholder="请输入姓名">
                            <span id="spanInStuSex"></span><br>
                                <input id="inStuSex" type="radio" class="radio" name="inStuSex" lay-verify="title" autocomplete="off" value="男" checked="true"/><lable class="la-radio">男</lable>
                                <input id="inStuSex1" type="radio" class="radio1" name="inStuSex" lay-verify="title" autocomplete="off" value="女" /><lable class="la-radio">女</lable><br>
                            <span id="spanInStuSchool" ></span>
                            <input id="inStuSchool" type="text" class="kuang_txt" name="inStuSchool" lay-verify="title" autocomplete="off" placeholder="请输入学校">
                            <span id="spanInStuDepart"></span>
                            <input id="inStuDepart" type="text" class="kuang_txt" name="inStuDepart" lay-verify="title" autocomplete="off" placeholder="请输入学院">
                            <span id="spanInStuMajor"></span>
                            <input id="inStuMajor" type="text" class="kuang_txt" name="inStuMajor" lay-verify="title" autocomplete="off" placeholder="请输入专业">
                            <span id="spanInStuGrade"></span>
                            <input id="inStuGrade" type="text" class="kuang_txt" name="inStuGrade" lay-verify="title" autocomplete="off" placeholder="请输入年级">
                            <span id="spanInStuClass"></span>
                            <input id="inStuClass" type="text" class="kuang_txt" name="inStuClass" lay-verify="title" autocomplete="off" placeholder="请输入班级">
                            <span id="spanInStuPhone"></span>
                            <input id="inStuPhone" type="text" class="kuang_txt inStuPhone" name="inStuPhone" lay-verify="title" autocomplete="off" placeholder="请输入联系方式">

                            <div>
                                <input name="" type="checkbox" value="" id="checkbox-id"><em>已阅读并同意<a href="#" target="_blank"><em class="lan">《人脸识别使用协议》</em></a></em>
                                <span id="spanAgree"></span>
                            </div>
                            <input  type="button" onclick="stuRegister()" class="btn_zhuce" value="注册"></input>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>


<#include "footer.ftl">
</div>
<script src="stylehtml/js/validate.js"></script>
<script>
    $(function () {
        getMedia();
        document.form.inStuId.focus();
        validate();
    })
    function getMedia() {
        // $("#mainDiv").empty();
        // $("#mainDiv").append(videoComp);
        let constraints = {
            video: {width: 250, height: 250},
            audio: true
        };
        //获得video摄像头区域
        let video = document.getElementById("video");
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then(function (MediaStream) {
            video.srcObject = MediaStream;
            video.play();
        });
    }



</script>
</body>
</html>