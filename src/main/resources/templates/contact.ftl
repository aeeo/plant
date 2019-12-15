<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>联系我们</title>

    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
    <link rel="stylesheet" href="stylehtml/css/contact.css"/>
</head>
<body>
<div class="container">
    <#include "top.ftl">
    <div class="row clearfix" id="body-contact">
        <div class="col-md-12 column">
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="carousel slide" id="carousel-915205">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#carousel-915205">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-915205">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-915205">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img alt="" src="stylehtml/img/8.png" width="100%"/>
                        <div class="carousel-caption">
                            <h4>
                                人脸识别技术
                            </h4>
                            <p>
                                是一种基于人的面部特征信息进行身份识别的一种生物识别技术，通常采用摄像机来采集含有人脸信息的图像或者视频流，并且自动在图像检测中进行跟踪并检测人脸信息进一步对检测到的人脸进行面部对比识别的一系列相关技术
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="stylehtml/img/9.jpg" width="100%" height="507px"/>
                        <div class="carousel-caption">
                            <h4>
                                考勤系统
                            </h4>
                            <p>
                                学生、教师、管理员三端管理的考勤系统，操作简捷，时效性强<br>
                                look forward to having you on board
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="stylehtml/img/10.png" width="100%" height="507px" />

                    </div>
                </div> <a class="left carousel-control" href="#carousel-915205" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-915205" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
            <div class="jumbotron well">
                <h1>
                    行星考勤
                </h1>
                <p>
                    基于B/S架构的Web项目
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="login">立即登录</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h2>
               团队简介
            </h2>
            <p>
                项目总监：赵通<br>
               开发：赵通、柯凯<br>
                测试：李康、蒋莉莉<br>
               策划：王国强<br>
            </p>

        </div>
        <div class="col-md-4 column">
            <h2>
                系统概述
            </h2>
            <p>
                人脸识别系统完美的规避了指纹系统层出不穷的漏洞。例如每名学生拥有多个不同的指纹，使得系统签到的重复性和可替代性大大提高。而采用人脸识别技术的考勤系统采集了每名学生独一无二的面部信息，大大提高了该应用程序的可靠性，使老师能更加便捷高效的管理学生信息，体现了其无可替代的实用价值。
            </p>

        </div>
        <div class="col-md-4 column">
            <h2>
                联系我们
            </h2>
            <p>
                邮箱：1234512123@qq.com<br>
                电话：124562121<br>
                通信地址：陕西省西安市雁塔区科技六路一号<br>
            </p>

        </div>
    </div>

</div>
<script>
    $("#contact").css('color','#20bfee');
</script>
</body>
</html>