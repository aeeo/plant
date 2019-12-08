<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生信息首页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script type="text/javascript" src="jquery/jquery-cookie/jquery.cookie.js"></script>
    <link rel="stylesheet" type="text/css" href="stylehtml/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="stylehtml/css/flexslider.css">
    <script type="text/javascript" src="stylehtml/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="stylehtml/js/main.js"></script>
    <link rel="stylesheet" type="text/css" href="stylehtml/css/thems.css">
    <link rel="stylesheet" type="text/css" href="stylehtml/css/responsive.css">
    <script language="javascript">
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide"
            });
        });
    </script>
</head>
<body>
<div class="container">
     <#include "top.ftl">
    <div class="scd clearfix">
        <div class="scd_l">
            <div class="title"></div>
            <ul class="s_nav">
                <li class="now"><a  id="stuInfo" onclick="stuInfo()"><em>学生信息</em></a></li>
                <li><a  id="stuInfoMod" onclick="stuInfoMod()"><em>信息修改</em></a></a></li>
                <li> <a  id="checkWork" onclick="checkWork()"><em>考勤情况</em></a></li>
                <li><a  id="modStuPassword" onclick="modStuPassword();"><em>修改密码</em></a></li>
                <li><a  id="logoutSession" onclick="logoutSession()"><em>注销</em></a></li>
            </ul>
        </div>
        <div class="scd_r">
            <div class="s_title">

                <div class="pst">
                    当前位置：
                    <a href="">首页</a>>
                    <a href="">关于行星考勤</a>>
                    <a href="">个人信息</a>
                </div>
            </div>
            <div class="scd_m">

            </div>
        </div>

    </div>
<#include "footer.ftl">


    <#--    学生信息展示 bootstrap的样式-->
        <#--<div class="col-md-12 column">
            <dl>
                <dt>
                    学号
                </dt>
                <dd id="stuId">

                </dd>
                <dt>
                    姓名
                </dt>
                <dd id="stuName">

                </dd>
                <dt>
                    性别
                </dt>
                <dd id="stuSex">

                </dd>
                <dt>
                    学校
                </dt>
                <dd id="stuSchool">

                </dd>
                <dt>
                    学院
                </dt>
                <dd id="stuDepart">

                </dd>
                <dt>
                    专业
                </dt>
                <dd id="stuMajor">

                </dd>
                <dt>
                    年级
                </dt>
                <dd id="stuGrade">

                </dd>
                <dt>
                    班级
                </dt>
                <dd id="stuClass">

                </dd>
                <dt>
                    联系方式
                </dt>
                <dd id="stuPhone">

                </dd>
            </dl>
        </div>-->
    <#--    学生信息修改 Layui的样式-->
    <#--<form class="layui-form" action="/stuInfoMod">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-block">
                <input id="inStuId" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input id="inStuName" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input id="inStuSex" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学校</label>
            <div class="layui-input-block">
                <input id="inStuSchool" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学院</label>
            <div class="layui-input-block">
                <input id="inStuDepart" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-block">
                <input id="inStuMajor" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-block">
                <input id="inStuGrade" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-block">
                <input id="inStuClass" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input id="inStuPhone" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-default btn-block" id="stuInfoMod">信息修改</button>-->
    <#--<div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>
                        学号
                    </th>
                    <th>
                        课程名
                    </th>
                    <th>
                        应到次数
                    </th>
                    <th>
                        缺课次数
                    </th>
                    <th>
                        代课老师
                    </th>
                    <th>
                        备注
                    </th>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>
            </table>
        </div>
    </div>-->
    <#--<div class="row clearfix">
        <div class="col-md-4 column">
            <form id="modStuPassword" role="form" action="/modStuPassword" method="post">
                <div class="form-group">
                    <label for="">原密码</label>
                    <input id="oldPassword" type="Password" class="form-control" name="oldPassword"/>
                </div>
                <div class="form-group">
                    <label for="">密码</label>
                    <input id="newPassword" type="Password" class="form-control" name="newPassword"/>
                </div>
                <button type="button" class="btn btn-default" onclick="modStuPasswordSubmit()">修改密码</button>
            </form>
        </div>
    </div>-->


</div>
<script>
    var account = {};
$(function () {
    stuInfo();
})
// 学生信息列表
function stuInfo() {
    let dynamic = $(".scd_m");
    dynamic.empty();
    let stuInfoList = "<div class=\"message\">\n" +
            "               <p>我的资料</p>\n"+
            "                <hr>\n" +
            "                <div class=\"message-bd\">\n" +
            "                    <div class=\"message-bd-left\">\n" +
            "                           姓名：<span id=\"stuName\"></span><br>\n" +
            "                           学号：<span id=\"stuId\"></span><br>\n" +
    "                                   学院：<span id=\"stuDepart\"></span><br>\n" +
    "                                   年级：<span id=\"stuGrade\"></span><br>\n" +
    "                                   联系方式：<span id=\"stuPhone\"></span>\n" +
    "                             </div>\n" +
    "                             <div class=\"message-bd-right\">\n" +
    "                                   性别：<span id=\"stuSex\"><br></span><br>\n" +
    "                                   学校：<span id=\"stuSchool\"></span><br>\n" +
    "                                   专业：<span id=\"stuMajor\"></span><br>\n" +
    "                                   班级：<span id=\"stuClass\"></span>\n" +
    "                             </div>\n" +
    "                         </div>\n" +
    "                       </div>";
    dynamic.append(stuInfoList);
    let stuId = new FormData;
    stuId.append("stuId", $.cookie("stuId"));
    $.ajax({
        type: "post",
        url: "/stuInfoQuery",
        data: stuId,
        contentType: false,
        processData: false,
        async: false,
        success: function (data) {
            account.stuId = data.stuId;
            account.stuName = data.stuName;
            account.stuSex = data.stuSex;
            account.stuSchool = data.stuSchool;
            account.stuDepart = data.stuDepart;
            account.stuMajor = data.stuMajor;
            account.stuGrade = data.stuGrade;
            account.stuClass = data.stuClass;
            account.stuPhone = data.stuPhone;

            $("#stuId").text(data.stuId);
            $("#stuName").text(data.stuName);
            $("#stuSex").text(data.stuSex);
            $("#stuSchool").text(data.stuSchool);
            $("#stuDepart").text(data.stuDepart);
            $("#stuMajor").text(data.stuMajor);
            $("#stuGrade").text(data.stuGrade);
            $("#stuClass").text(data.stuClass);
            $("#stuPhone").text(data.stuPhone);
        },
        error: function () {
            alert("错误！")
        }
    })
}


    //学生信息修改
    function stuInfoMod() {
        let dynamic = $(".scd_m");
        // let modStuList = "<form id=\"formMod\" class=\"layui-form\" method =\"post\" action=\"/stuStuInfoMod\">\n" +
        let modStuList = "<form id=\"formMod\" class=\"layui-form\" method =\"post\">\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学号</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuId\" type=\"text\" name=\"inStuId\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input layui-disabled\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">姓名</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuName\" type=\"text\" name=\"inStuName\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input layui-disabled\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">性别</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuSex\" type=\"text\" name=\"inStuSex\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学校</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuSchool\" type=\"text\" name=\"inStuSchool\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学院</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuDepart\" type=\"text\" name=\"inStuDepart\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">专业</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuMajor\" type=\"text\" name=\"inStuMajor\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">年级</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuGrade\" type=\"text\" name=\"inStuGrade\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">班级</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuClass\" type=\"text\" name=\"inStuClass\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">联系方式</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuPhone\" type=\"text\" name=\"inStuPhone\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入标题\"\n" +
            "                       class=\"layui-input\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <button type=\"button\" onclick=\"modInfo()\" class=\"btn btn-default\" id=\"stuInfoMod\">信息修改</button>" +
            "</form>";
            // "        <button type=\"submit\" class=\"btn btn-default\" id=\"stuInfoMod\">信息修改</button>";

        dynamic.empty();
        dynamic.append(modStuList);
        $("#inStuId").attr("value", account.stuId);
        $("#inStuName").attr("value", account.stuName);
        $("#inStuSex").attr("value", account.stuSex);
        $("#inStuSchool").attr("value", account.stuSchool);
        $("#inStuDepart").attr("value", account.stuDepart);
        $("#inStuMajor").attr("value", account.stuMajor);
        $("#inStuGrade").attr("value", account.stuGrade);
        $("#inStuClass").attr("value", account.stuClass);
        $("#inStuPhone").attr("value", account.stuPhone);
    }
    function modInfo() {
        $.ajax({
            type: "post",
            url: "stuStuInfoMod",
            data:$("#formMod").serialize(),
            success(data){
                if (data == "success") {
                    alert("修改成功。");
                } else {
                    alert("修改失败。");
                }
            },
            error(){
                alert("页面错误。");
            }
        });
    }

    function checkWork() {
        let dynamic = $(".scd_m");
        let checkList = "<div class=\"row clearfix\">\n" +
            "        <div class=\"col-md-12 column\">\n" +
            "            <table id='checktable' class=\"table table-bordered table-hover\">\n" +
            "                <thead>\n" +
            "                <tr>\n" +
            "                    <th>\n" +
            "                        学号\n" +
            "                    </th>\n" +
            "                    <th>\n" +
            "                        课程名\n" +
            "                    </th>\n" +
            "                    <th>\n" +
            "                        应到次数\n" +
            "                    </th>\n" +
            "                    <th>\n" +
            "                        缺课次数\n" +
            "                    </th>\n" +
            "                    <th>\n" +
            "                        代课老师\n" +
            "                    </th>\n" +
            "                    <th>\n" +
            "                        备注\n" +
            "                    </th>\n" +
            "                </tr>\n" +
            "                </thead>\n" +
            "            </table>\n" +
            "        </div>\n" +
            "    </div>";
        dynamic.empty();
        dynamic.append(checkList);
        let stuId = new FormData();
        stuId.append("stuId", $.cookie("stuId"));
        let stuCheckList = {};
        $.ajax({
            type: "post",
            contentType: false,
            processData: false,
            url: "/stuChecking",
            data: stuId,
            async:false,
            success(data){
                stuCheckList = eval(data);
            },
            error(){
                alert("请求失败！");
            }
        });
        for (let i = 0; i < stuCheckList.length; i++) {
            $("#checktable").append(
                "<tbody>\n" +
                "<tr>\n" +
                    "<td>\n" + stuCheckList[i].stuId + "</td>\n" +
                    "<td>\n" + stuCheckList[i].stuCourse + "</td>\n" +
                    "<td>\n" + stuCheckList[i].stuArrive + "</td>\n" +
                    "<td>\n" + stuCheckList[i].stuAbsence + "</td>\n" +
                    "<td>\n" + stuCheckList[i].stuTeach + "</td>\n" +
                    "<td>\n" + stuCheckList[i].stuRemark + "</td>\n" +
                "</tr>" +
                "</tbody>"
            );
        }
    }
    function logoutSession() {
        $.ajax({
            url: "logoutSession",
            async: false,
            success(){
                alert("注销成功");
                location.reload();
            },
            error(){
                alert("注销失败");
            }
        });
    }
    function modStuPassword(){

        let dynamic = $(".scd_m");
        dynamic.empty();
        let modPasswordList = "<div class=\"row clearfix\">\n" +
            "        <div class=\"col-md-4 column\">\n" +
            "            <form id=\"modStuPassword\" role=\"form\" action=\"/modStuPassword\" method=\"post\">\n" +
            "                <div class=\"form-group\">\n" +
            "                    <label for=\"\">原密码</label>\n" +
            "                    <input id=\"oldPassword\" type=\"Password\" class=\"form-control\" name=\"oldPassword\"/>\n" +
            "                </div>\n" +
            "                <div class=\"form-group\">\n" +
            "                    <label for=\"\">密码</label>\n" +
            "                    <input id=\"newPassword\" type=\"Password\" class=\"form-control\" name=\"newPassword\"/>\n" +
            "                </div>\n" +
                "                <div class=\"form-group\">\n" +
                "                    <label for=\"\">确认密码</label>\n" +
                "                    <input id=\"newPassword\" type=\"Password\" class=\"form-control\" name=\"newPassword\"/>\n" +
                "                </div>\n" +
            "                <button type=\"button\" class=\"btn btn-default\" onclick=\"modStuPasswordSubmit()\">修改密码</button>\n" +
            "            </form>\n" +
            "        </div>\n" +
            "    </div>";
        dynamic.append(modPasswordList);
    }
    function modStuPasswordSubmit() {
        var stuId = new FormData();
        stuId.append("stuId", $.cookie("stuId"));
        stuId.append("oldPassword",$("#oldPassword").val());
        stuId.append("newPassword",$("#newPassword").val());
        $.ajax({
            type: "post",
            url: "modStuPassword",
            data: stuId,
            contentType: false,
            processData: false,
            async: false,
            success(data){
                if (data == "success") {
                    alert("修改成功。");
                } else if(data == "fail"){
                    alert("修改失败。");
                }
            },
            error(){
                alert("提交错误。");
            }
        });
    }
</script>
</body>
</html>