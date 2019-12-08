<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生注册页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link rel="stylesheet" href="stylehtml/css/register.css"/>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
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
                        <form id="registerStuInfo"  method="post">
                            <input id="inStuId" type="text" class="kuang_txt inStuId" name="inStuId" lay-verify="title" autocomplete="off" placeholder="请输入学号">
                            <input id="inStuPassword" type="password" class="kuang_txt inStuPassword" name="inStuPassword" lay-verify="title" autocomplete="off" placeholder="请输入密码">
                            <input id="inStuName" type="text" class="kuang_txt" name="inStuName" lay-verify="title" autocomplete="off" placeholder="请输入姓名">
                            <input id="inStuSex" type="text" class="kuang_txt" name="inStuSex" lay-verify="title" autocomplete="off" placeholder="请输入性别">
                            <input id="inStuSchool" type="text" class="kuang_txt" name="inStuSchool" lay-verify="title" autocomplete="off" placeholder="请输入学校">
                            <input id="inStuDepart" type="text" class="kuang_txt" name="inStuDepart" lay-verify="title" autocomplete="off" placeholder="请输入学院">
                            <input id="inStuMajor" type="text" class="kuang_txt" name="inStuMajor" lay-verify="title" autocomplete="off" placeholder="请输入专业">
                            <input id="inStuGrade" type="text" class="kuang_txt" name="inStuGrade" lay-verify="title" autocomplete="off" placeholder="请输入年级">
                            <input id="inStuClass" type="text" class="kuang_txt" name="inStuClass" lay-verify="title" autocomplete="off" placeholder="请输入班级">
                            <input id="inStuPhone" type="text" class="kuang_txt inStuPhone" name="inStuPhone" lay-verify="title" autocomplete="off" placeholder="请输入联系方式">
                            <div>
                                <input name="" type="checkbox" value=""><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《人脸识别使用协议》</span></a></span>
                            </div>
                            <button onclick="stuRegister()" class="btn_zhuce">注册</button>
                        </form>

                </div>

            </div>
        </div>
    </div>
</div>


<#include "footer.ftl">
</div>
<script>
    $(function () {
        getMedia();

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

    function stuRegister() {
        let mainComp = $("#mainDiv");
        //获得Canvas对象
        let video = document.getElementById("video");
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, 250, 250);
        let formData = new FormData();
        //保存当前图片
        var base64File = canvas.toDataURL();
        formData.append("file", base64File);
        formData.append("inStuId", $("#inStuId").val());
        formData.append("inStuPassword", $("#inStuPassword").val());
        formData.append("inStuName", $("#inStuName").val());
        formData.append("inStuSex", $("#inStuSex").val());
        formData.append("inStuSchool", $("#inStuSchool").val());
        formData.append("inStuDepart", $("#inStuDepart").val());
        formData.append("inStuGrade", $("#inStuGrade").val());
        formData.append("inStuMajor", $("#inStuMajor").val());
        formData.append("inStuClass", $("#inStuClass").val());
        formData.append("inStuPhone", $("#inStuPhone").val());

        $.ajax({
            type: "post",
            url: "/stuRegister",
            data: formData,
            async:false,
            contentType: false,
            processData: false,
            success: function (text) {
                if (text == "register success") {
                    alert("成功");
                    window.location.href = 'index';
                } else {
                    alert("失败");
                }
            },
            error: function (error) {
                alert("失败")
            }
        });

    }
</script>
</body>
</html>