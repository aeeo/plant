<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生注册页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" >
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
    <#--获取摄像头区域-->
    <div id="mainDiv" class="col-lg-4 col-md-5  col-sm-6">
        <video id='video' width='100%' height='100%' autoplay='autoplay'>

        </video>
        <canvas id='canvas' width='500px' height='500px' style='display: none'>

        </canvas>
    </div>
    <form id="registerStuInfo" class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-block">
                <input id="inStuId" type="text" name="inStuId" lay-verify="title" autocomplete="off" placeholder="请输入学号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input id="inStuPassword" type="password" name="inStuPassword" lay-verify="title" autocomplete="off" placeholder="请输入密码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input id="inStuName" type="text" name="inStuName" lay-verify="title" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input id="inStuSex" type="text" name="inStuSex" lay-verify="title" autocomplete="off" placeholder="请输入性别"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学校</label>
            <div class="layui-input-block">
                <input id="inStuSchool" type="text" name="inStuSchool" lay-verify="title" autocomplete="off" placeholder="请输入学校"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学院</label>
            <div class="layui-input-block">
                <input id="inStuDepart" type="text" name="inStuDepart" lay-verify="title" autocomplete="off" placeholder="请输入学院"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-block">
                <input id="inStuMajor" type="text" name="inStuMajor" lay-verify="title" autocomplete="off" placeholder="请输入专业"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-block">
                <input id="inStuGrade" type="text" name="inStuGrade" lay-verify="title" autocomplete="off" placeholder="请输入年级"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-block">
                <input id="inStuClass" type="text" name="inStuClass" lay-verify="title" autocomplete="off" placeholder="请输入班级"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input id="inStuPhone" type="text" name="inStuPhone" lay-verify="title" autocomplete="off" placeholder="请输入联系方式"
                       class="layui-input">
            </div>
        </div>
    </form>
    <button onclick="stuRegister()" class="btn btn-primary btn-default btn-block">注册</button>

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

        function stuRegister() {
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