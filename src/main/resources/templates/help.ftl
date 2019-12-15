<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>帮助</title>

    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
    <link rel="stylesheet" href="stylehtml/css/help.css"/>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <#include "top.ftl">
        </div>
    </div>
    <div class="row clearfix" id="help-body">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column" id="help-body-left">
                    <div class="help-body-left-a">
                        <p>帮助文档</p>
                         <p>反馈信息</p>
                    </div>


                </div>
                <div class="col-md-6 column">
                    <h2 id="help-title">
                        Heading
                    </h2>

                    <p id="help-text">
                        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                    </p>


                </div>
                <div class="col-md-4 column">
                    <a href="#" class="list-group-item active">公告栏</a>
                    <blockquote>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                        </p> <small>Someone famous <cite>Source Title</cite></small>
                    </blockquote>
                    <blockquote>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                        </p> <small>Someone famous <cite>Source Title</cite></small>
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<script>
    $("#help").css('color','#20bfee')

   $("#text1").on("click",function () {
       $("#help-title").html("人脸识别失败解决方案<br><hr color=\"#e0e0e0\">");
       $("#help-text").html("联系管理员解决");
   })
   $("#text2").on("click",function () {
       $("#help-title").html("注册不了解决方案<br><hr color=\"#e0e0e0\">");
       $("#help-text").html("联系管理员解决");
   })
   $("#text3").on("click",function () {
       $("#help-title").html("手机无法打开摄像头解决方案<br><hr color=\"#e0e0e0\">");
       $("#help-text").html("联系管理员解决");
   })
   $("#text4").on("click",function () {
       $("#help-title").html("系统漏洞<br><hr color=\"#e0e0e0\">");
       $("#help-text").html("联系管理员解决");
   })
</script>
</body>
</html>