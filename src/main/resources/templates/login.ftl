<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生登陆页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>

</head>
<body>
<#--<div th:include="top.ftl"></div>-->
    <#--提交表单-->
    <div class="container">
        <#include "top.ftl">

        <div id="tbody">

              <div class="b-logo-register">
                  <div class="b-logo-top">
                      <a  class="zhanghao">人脸登录</a>
                      <span class="link"></span>
                      <a  class="saoma">账号登录</a>
                  </div>
              <#--获取摄像头区域-->
                    <div class="b-logo-bottom1" >
                        <div id="shijian">
                            <div id="mainDiv">
                                <video id='video' width='100%' height='100%' autoplay='autoplay'> </video>
                                <canvas id='canvas' width='250px' height='250px' style='display: none'> </canvas>
                            </div>
                            <input type="submit" value="人脸登录" class="renlian" onclick="faceLogin()"><br>
                            <a onclick="window.location.href='register'">立即注册</a>
                            <a href="" >忘记密码?</a>
                        </div>
                </div>
                  <div class="b-logo-botom">
                        <form role="form" action="/accountLogin" method="post">
                            <input type="text" placeholder="邮箱/手机号码/学号"  name="userId" id="userId" />
                            <input type="password" placeholder="密码"  name="userPassword" id="password" />
                            <input type="submit" value="登录" id="submit" >
                            <br>
                           <a onclick="window.location.href='register'">立即注册</a>
                            |
                            <a href="" >忘记密码?</a>
                        </form>
                  </div>

                </div>
          </div>
        <#include "footer.ftl">
    </div>

<script>
    $(function () {
        getMedia();
    })
    $(document).ready(function(){
        $(".zhanghao").hover(function(){
            $(".b-logo-botom").css('display', 'none');
            $(".b-logo-bottom1").css('display', 'block');
            $(this).css('color','#ff6700');
            $(".saoma").css('color','#666666');
        });
        $(".saoma").hover(function(){
            $(".b-logo-botom").css('display', 'block');
            $(".b-logo-bottom1").css('display', 'none');
            $(this).css('color','#ff6700');
            $(".zhanghao").css('color','#666666');

        });
    });

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
    //登录页面人脸识别学生信息
    function faceLogin(){
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
        $.ajax({
            type: "post",
            url: "/faceRecogn",
            data: formData,
            contentType: false,
            processData: false,
            async: false,
            success: function (text) {
                alert("登录成功。");
                window.location.href = 'index';
            },
            error: function (error) {
                alert("人脸登录不成功")
            }
        });
    }
    function stuRegister() {
        $("#inStuId").val();
        $("#inStuName").val();
        $("#inStuSex").val();
        $("#inStuSchool").val();
        $("#inStuDepart").val();
        $("#inStuMajor").val();
        $("#inStuGrade").val();
        $("#inStuClass").val();
        $("#inStuPhone").val();
    }
</script>
</body>
</html>