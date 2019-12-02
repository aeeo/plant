<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生登陆页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
    <#--提交表单-->
    <div class="container">
        <h1>行星人脸识别考勤系统</h1>
        <#--获取摄像头区域-->
        <div id="mainDiv" class="col-lg-4 col-md-5  col-sm-6">
            <video id='video' width='100%' height='100%' autoplay='autoplay'>

            </video>
            <canvas id='canvas' width='500px' height='500px' style='display: none'>

            </canvas>
        </div>
        <div>
            <button onclick="faceLogin()" class="btn btn-default">人脸识别登录</button>
        </div>

        <div class="row clearfix">
            <div class="col-md-4 column">
                <form role="form" action="/accountLogin" method="post">
                    <div class="form-group" >
                        <label for="">用户名</label>
                        <input type="text" class="form-control" name="userId" id="userId" />
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input type="password" class="form-control" name="userPassword" id="password" />
                    </div>
                    <button type="submit" class="btn btn-default">账号登录提交</button>
                </form>
            </div>
        </div>

        <div>
            <button onclick="window.location.href='register'" class="btn btn-default">注册</button>
        </div>

    </div>

<script>
    $(function () {
        getMedia();
    })
    function getMedia() {
        // $("#mainDiv").empty();
        // $("#mainDiv").append(videoComp);
        let constraints = {
            video: {width: 500, height: 500},
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
        ctx.drawImage(video, 0, 0, 500, 500);
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
                alert(text);
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