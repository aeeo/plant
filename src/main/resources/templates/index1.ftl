<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <style>
        h1{margin-bottom:50px; }
        #mainDiv{
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">

                    <h1 class="text-center" >
                        人脸识别系统
                    </h1>

            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-4 column">
                <h3 class="text-left">
                    录入信息总库
                </h3>
                <table class="table table-hover">
                    <tr>
                    </tr>
                    <tbody id="userTable">

                    </tbody>
                </table>
                <ul class="pagination pagination-sm">
                    <li>
                        <a href="#">Prev</a>
                    </li>
                    <li>
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">Next</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 column">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <#--                    <img class="img-responsive" src="images/shibie.jpg" />-->
                        <div id="mainDiv" class="col-lg-12">

                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-4 column">

                <ul class="nav nav-tabs">
                    <li>
                        <a href="#" onclick="registerFace()">人脸注册</a>
                    </li>
                    <li>
                        <a href="#" onclick="recognFace()">人脸识别</a>
                    </li>
                </ul>
                <div id="right">

                </div>

            </div>
        </div>
    </div>
    <script>

        $(function () {
            f();
            getMedia();
            registerFace();
        })
        function f() {
            $.ajax({
                type:"get",
                url:"/userInfo",
                success:function (stuFaceAccountList) {
                    if(stuFaceAccountList.length == 0)
                    {
                        let addElement = "<h2>暂无用户</h2>";
                        $("#userTable").append(addElement);
                    }
                    $("#userTable").empty();
                    for (let i = 0; i < stuFaceAccountList.length; i++) {
                        let id = i+1;

                        let userName = stuFaceAccountList[i].userId;
                        let createTime = stuFaceAccountList[i].userName;
                        let addElement = "<tr><td>" + id + "</td><td>" + userName + "</td><td>" + createTime + "</td></tr>";

                        $("#userTable").append(addElement);
                    }
                },
                dataType:"json",
                error: function (error) {
                    alert("cuowu");
                    // alert(JSON.stringify(error))
                }
            });
        }
        function registerFace(){
            f();
            getMedia();
            $("#right").empty();
            $("#right").append("<form role=\"form\">\n" +
                "<div class=\"form-group\">\n" +
                "<label for=\"exampleInputEmail1\">学号</label><input type=\"text\" class=\"form-control\" id=\"userId\" />\n" +
                "</div>\n" +
                "<div class=\"form-group\">\n" +
                "<label for=\"exampleInputPassword1\">密码</label><input type=\"password\" class=\"form-control\" id=\"userPassword\" />\n" +
                "</div>\n" +
                "<div class=\"form-group\">\n" +
                "<label for=\"exampleInputPassword1\">姓名</label><input type=\"text\" class=\"form-control\" id=\"userName\" />\n" +
                "</div>\n" +
                "</form>\n" +
                "<button type=\"button\" class=\"btn btn-default\" onclick=\"takePhoto()\">提交</button>\n");
        }
        function recognFace(){
            f();
            getMedia();
            $("#right").empty();
            $("#right").append("<button id='shibie' type=\"button\" class=\"btn btn-default\" onclick=\"shibie()\">识别</button>");
        }

        function shibie(){
            var url = "http://127.0.0.1:8080";
            let mainComp = $("#mainDiv");

            //获得Canvas对象
            let video = document.getElementById("video");
            let canvas = document.getElementById("canvas");
            let ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, 500, 500);
            var formData = new FormData();
            //保存当前图片
            var base64File = canvas.toDataURL();
            formData.append("file", base64File);

            $.ajax({
                type: "post",
                url: url + "/faceRecogn",
                data: formData,
                contentType: false,
                processData: false,
                async: false,
                success: function (text) {
                    var res = JSON.stringify(text)
                    // if (text == "success") {
                    //     alert("注册成功")
                    // } else {
                    //     alert(text.message)
                    // }
                    alert(text.userName + "你好。")
                },
                error: function (error) {
                    alert("不成功1")
                    // alert(JSON.stringify(error))
                }
            });
        }
        function getMedia() {
            $("#mainDiv").empty();
            let videoComp = " <video id='video' width='100%' height='100%' autoplay='autoplay'></video><canvas id='canvas' width='500px' height='500px' style='display: none'></canvas>";
            $("#mainDiv").append(videoComp);

            let constraints = {
                video: {width: 500, height: 500},
                audio: true
            };
            //获得video摄像头区域
            let video = document.getElementById("video");
            //这里介绍新的方法，返回一个 Promise对象
            // 这个Promise对象返回成功后的回调函数带一个 MediaStream 对象作为其参数
            // then()是Promise对象里的方法
            // then()方法是异步执行，当then()前的方法执行完后再执行then()内部的程序
            // 避免数据没有获取到
            let promise = navigator.mediaDevices.getUserMedia(constraints);
            promise.then(function (MediaStream) {
                video.srcObject = MediaStream;
                video.play();
            });

            // var t1 = window.setTimeout(function() {
            //     takePhoto();
            // },2000)
        }
        //拍照事件
        function takePhoto() {

            let mainComp = $("#mainDiv");

            let userNameInput = $("#userName").val();
            if(userNameInput == "")
            {
                alert("姓名不能为空!");
                return false;
            }
            //获得Canvas对象
            let video = document.getElementById("video");
            let canvas = document.getElementById("canvas");
            let ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, 500, 500);
            var formData = new FormData();
            //保存当前图片
            var base64File = canvas.toDataURL();
            var userId = $("#userId").val();
            var userPassword = $("#userPassword").val();
            var userName = $("#userName").val();
            formData.append("file", base64File);
            formData.append("userId", userId);
            formData.append("userPassword", userPassword);
            formData.append("userName", userName);

            $.ajax({
                type: "post",
                url: "/faceAdd",
                data: formData,
                contentType: false,
                processData: false,
                async: false,
                success: function (text) {
                    var res = JSON.stringify(text)
                    if (text == "success") {
                        alert("注册成功")
                    } else {
                        alert(text.message)
                    }
                },
                error: function (error) {
                    alert("不成功2")
                    // alert(JSON.stringify(error))
                }
            });
        }
    </script>
</body>
</html>