<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生登陆页面</title>
    <script src="stylehtml/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="stylehtml/css/ui.progress-bar.css"/>
    <link rel="stylesheet" href="stylehtml/css/ui.css"/>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
    <script src="stylehtml/js/progress.js" type="text/javascript" charset="utf-8"></script>

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
                            <div id="progress">
                                <input type="submit" value="人脸登录" class="renlian" onclick="faceLogin()"><br>
                                <a onclick="window.location.href='register'">立即注册</a>
                            </div>

                        </div>
                </div>
                  <div class="b-logo-botom">
                        <form role="form" action="/accountLogin" method="post" onsubmit="return checkUser()" >
                            <span id="tishiUsername"></span>
                            <input type="text" placeholder="邮箱/手机号码/学号"  name="userId" id="userId" /><br>
                            <span id="tishiPwd"></span>
                            <input type="password" placeholder="密码"  name="userPassword" id="password" /><br>
                            <input type="submit" value="登录" id="submit" >
                            <br>
                           <a onclick="window.location.href='register'">立即注册</a>

                        </form>
                  </div>

                </div>
          </div>
        <#include "footer.ftl">
    </div>



<script>
    $(function () {
        getMedia();
        $(".aIndex").css('color','#20bfee')
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
        }).catch(function (PermissionDeniedError) {
            console.log(PermissionDeniedError);
        })
    }
    //登录页面人脸识别学生信息
    function faceLogin(){
        $(".renlian").css('display','none');
        $("#progress").html("<div id=\"progress_bar\" class=\"ui-progress-bar ui-container\">\n" +
                "\t<div class=\"ui-progress\" style=\"width: 79%;\">\n" +
                "\t<span class=\"ui-label\" style=\"display:none;\">正在识别...<b class=\"value\">79%</b></span>\n" +
                "\t</div>\n" +
                "\t</div>\n" +
                "\t<!-- /Progress bar -->\n" +
                "\n" +
                "\t<div   style=\"display: none;\">\n" +
                "\t\t<a id=\"main_content\"></a>\n" +
                "\t</div>");
        //进度条

        (function( $ ){
            // Simple wrapper around jQuery animate to simplify animating progress from your app
            // Inputs: Progress as a percent, Callback
            // TODO: Add options and jQuery UI support.
            $.fn.animateProgress = function(progress, callback) {
                return this.each(function() {
                    $(this).animate({
                        width: progress+'%'
                    }, {
                        duration: 200,

                        // swing or linear
                        easing: 'swing',

                        // this gets called every step of the animation, and updates the label
                        step: function( progress ){
                            var labelEl = $('.ui-label', this),
                                    valueEl = $('.value', labelEl);

                            if (Math.ceil(progress) < 20 && $('.ui-label', this).is(":visible")) {
                                labelEl.hide();
                            }else{
                                if (labelEl.is(":hidden")) {
                                    labelEl.fadeIn();
                                };
                            }

                            if (Math.ceil(progress) == 100) {
                                labelEl.text('完成');
                                setTimeout(function() {
                                    labelEl.fadeOut();
                                }, 0);
                            }else{
                                valueEl.text(Math.ceil(progress) + '%');
                            }
                        },
                        complete: function(scope, i, elem) {
                            if (callback) {
                                callback.call(this, i, elem );
                            };
                        }
                    });
                });
            };
        })( jQuery );

        $(function() {
            // Hide the label at start
            $('#progress_bar .ui-progress .ui-label').hide();
            // Set initial value
            $('#progress_bar .ui-progress').css('width', '7%');

            // Simulate some progress
            $('#progress_bar .ui-progress').animateProgress(43, function() {
                $(this).animateProgress(79, function() {
                    setTimeout(function() {
                        $('#progress_bar .ui-progress').animateProgress(100, function() {
                            $('#main_content').css('display','inline');

                            $('#fork_me').fadeIn();
                        });
                    }, 200);
                });
            });

        });


        //

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

        var int=self.setInterval(function(){  // 这个方法是说在延迟两秒后执行大括号里的方法
            $.ajax({
                type: "post",
                url: "/faceRecogn",
                data: formData,
                contentType: false,
                processData: false,
                async: false,
                success: function (text) {
                    if(text=="success"){
                        window.location.href = 'index';
                    }else if(text!="success"){
                        alert("识别失败");
                        window.location.href = "login";
                    }
                },
                error: function (error) {
                    alert("识别失败");
                    window.location.href = "login";
                }
            });
        },1200)


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

    function checkUser() {
        var username = document.getElementById("userId").value;

        if (username == "") {
            document.getElementById("tishiUsername").innerHTML = "用户名不能为空";
            $("#tishiUsername").css('display', 'block');
            $("#userId").css('border', '1px solid red');
            return false;
        } else {
            document.getElementById("tishiUsername").innerHTML = "";
            $("#tishiUsername").css('display', 'none');
            $("#userId").css('border', '1px solid #dddddd');
        }

        var pwd = document.getElementById("password").value;
        if (pwd == "") {
            document.getElementById("tishiPwd").innerHTML = "密码不能为空";
            $("#tishiPwd").css('display', 'block');
            $("#password").css('border', '1px solid red');
            return false;
        } else {
            $("#tishiPwd").css('display', 'none');
            $("#password").css('border', '1px solid #dddddd');
            return true;
        }

    }

</script>
</body>
</html>