<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>学生信息首页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
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
    <link rel="stylesheet" href="stylehtml/css/enter.css"/>
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
                    <a onclick="window.location.href='login'" class="aIndex">首页</a><
                    <a id="clickNav">个人信息</a>
                </div>
            </div>
            <div class="scd_m">

            </div>
        </div>

    </div>
<#include "footer.ftl">
</div>
<script src="stylehtml/js/validate.js"></script>
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
        $("#clickNav").html("信息修改");
        let dynamic = $(".scd_m");
        // let modStuList = "<form id=\"formMod\" class=\"layui-form\" method =\"post\" action=\"/stuStuInfoMod\">\n" +
        let modStuList = "<form id=\"formMod\" class=\"layui-form\" method =\"post\">\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学号</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuId\" type=\"text\" name=\"inStuId\" lay-verify=\"title\" readonly=\"readonly\" placeholder=\"学号输入不能为空\"\n" +
            "                       class=\"layui-input layui-disabled\"><span class=\"spanStuId\">*学号不允许修改</span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">姓名</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuName\" type=\"text\" name=\"inStuName\" lay-verify=\"title\" readonly=\"readonly\" placeholder=\"姓名输入不能为空\"\n" +
            "                       class=\"layui-input layui-disabled\"><span class=\"spanStuId\">*姓名不允许修改</span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">性别</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "  <input id=\"inStuSex\" type=\"radio\" class=\"radio\" name=\"inStuSex\" lay-verify=\"title\" autocomplete=\"off\" value=\"男\" checked=\"true\"/><lable class=\"la-radio\">男</lable>\n"+
            "   <input id=\"inStuSex1\" type=\"radio\" class=\"radio1\" name=\"inStuSex\" lay-verify=\"title\" autocomplete=\"off\" value=\"女\" /><lable class=\"la-radio\">女</lable><br>\n"+
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学校</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuSchool\" type=\"text\" name=\"inStuSchool\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"学校输入不能为空\"\n" +
            "                       class=\"layui-input\"><span id=\"spanInStuSchool\" ></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">学院</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuDepart\" type=\"text\" name=\"inStuDepart\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"学院输入不能为空\"\n" +
            "                       class=\"layui-input\"><span id=\"spanInStuDepart\"></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">专业</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuMajor\" type=\"text\" name=\"inStuMajor\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"专业输入不能为空\"\n" +
            "                       class=\"layui-input\"><span id=\"spanInStuMajor\"></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">年级</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuGrade\" type=\"text\" name=\"inStuGrade\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"年级输入不能为空\"\n" +
            "                       class=\"layui-input\"><span id=\"spanInStuGrade\"></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">班级</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuClass\" type=\"text\" name=\"inStuClass\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"班级输入不能为空\"\n" +
            "                       class=\"layui-input\"><span id=\"spanInStuClass\"></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"layui-form-item\">\n" +
            "            <label class=\"layui-form-label\">联系方式</label>\n" +
            "            <div class=\"layui-input-block\">\n" +
            "                <input id=\"inStuPhone\" type=\"text\" name=\"inStuPhone\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"电话输入不能为空\"\n" +
            "                       class=\"layui-input\"> <span id=\"spanInStuPhone\"></span>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <button type=\"button\" onclick=\"modInfo()\" class=\"btn btn-default\" id=\"stuInfoMod\">信息修改</button>" +
            "</form>";
            // "        <button type=\"submit\" class=\"btn btn-default\" id=\"stuInfoMod\">信息修改</button>";


        dynamic.empty();
        dynamic.append(modStuList);
        $("#inStuId").attr("value", account.stuId);
        $("#inStuName").attr("value", account.stuName);
        $('input:radio[name="inStuName"]:checked').attr("value", account.stuSex);
        $("#inStuSchool").attr("value", account.stuSchool);
        $("#inStuDepart").attr("value", account.stuDepart);
        $("#inStuMajor").attr("value", account.stuMajor);
        $("#inStuGrade").attr("value", account.stuGrade);
        $("#inStuClass").attr("value", account.stuClass);
        $("#inStuPhone").attr("value", account.stuPhone);
        validate();
    }


    function modInfo() {
        validateClick();

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
//考勤情况
    function checkWork() {
        $("#clickNav").html("考勤情况");
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
            "                        签到次数\n" +
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
            "                    <input id=\"newPassword\" type=\"Password\" class=\"form-control\" name=\"newPassword\"/><span id=\"tishiChange\"></span>\n" +
            "                </div>\n" +
                "                <div class=\"form-group\">\n" +
                "                    <label for=\"\">确认密码</label>\n" +
                "                    <input id=\"newPassword1\" type=\"Password\" class=\"form-control\" name=\"newPassword\"/>\n" +
                "                </div>\n" +
            "                <button type=\"button\" class=\"btn btn-default\" onclick=\"modStuPasswordSubmit()\">修改密码</button>\n" +
            "            </form>\n" +
            "        </div>\n" +
            "    </div>";
        dynamic.append(modPasswordList);
    }
//密码修改
    function modStuPasswordSubmit() {
        $("#clickNav").html("修改密码");
        if(($("#newPassword").val())!=($("#newPassword1").val())){
            $("#newPassword").css('border','1px solid red');
            $("#newPassword1").css('border','1px solid red');
            $("#tishiChange").css('display','inline');
            $("#tishiChange").html("两次密码输入不一致");
            return;
        }
        $("#newPassword1").on("focus",function () {
            $("#tishiChange").css('display','block');
            $("#tishiChange").html("");
        });
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
                    alert("修改成功！");
                } else if(data == "fail"){
                    alert("密码输入有误！");
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