<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/plugins/images/favicon.png">
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="/teachback/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/teachback/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/teachback/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="/teachback/css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
<![endif]-->
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a class="logo" href="../teachIndex.ftl">
                        <!-- Logo icon image, you can use font-icon also --><b>
                            <!--This is dark logo icon--><img src="/plugins/images/admin-logo.png" alt="home"
                                class="dark-logo" />
                            <!--This is light logo icon--><img src="/plugins/images/admin-logo-dark.png" alt="home"
                                class="light-logo" />
                        </b>
                        <!-- Logo text image you can use text also --><span class="hidden-xs">
                            <!--This is dark logo text--><img src="/plugins/images/admin-text.png" alt="home"
                                class="dark-logo" />
                            <!--This is light logo text--><img src="/plugins/images/admin-text-dark.png" alt="home"
                                class="light-logo" />
                        </span> </a>
                </div>
                <!-- /Logo -->
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg"
                            href="javascript:void(0)"><i class="fa fa-bars"></i></a>
                    </li>
                    <li>
                        <form role="search" class="app-search hidden-sm hidden-xs m-r-10">
                            <input type="text" placeholder="Search..." class="form-control"> <a href=""><i
                                    class="fa fa-search"></i></a> </form>
                    </li>
                    <li>
                        <a class="profile-pic" href="#"> <img src="/plugins/images/users/varun.jpg" alt="user-img"
                                width="36" class="img-circle"><b class="hidden-xs">Steave</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span
                            class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 70px 0 0;">
                        <a href="teachIndex" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>首页</a>
                    </li>
                    <li>
                        <a href="teachInfoMod" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>信息修改</a>
                    </li>
                    <li>
                        <a href="teachCourse" class="waves-effect"><i class="fa fa-table fa-fw" aria-hidden="true"></i>课程管理</a>
                    </li>
                    <li>
                        <a href="teach/basic-table.html" class="waves-effect"><i class="fa fa-table fa-fw" aria-hidden="true"></i>学生信息管理</a>
                    </li>
                    <li>
                        <a href="teach/fontawesome.html" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>发布信息</a>
                    </li>

                    <li>
                        <a href="teach/blank.html" class="waves-effect"><i class="fa fa-columns fa-fw" aria-hidden="true"></i>信息反馈</a>
                    </li>
                </ul>
                <div class="center p-20">
                    <a href="#" target="_blank"
                        class="btn btn-danger btn-block waves-effect waves-light">Upgrade to Pro</a>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Profile page</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="#" target="_blank"
                            class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Upgrade
                            to Pro</a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Profile Page</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">

                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <form id="courseForm" class="form-horizontal form-material">
                                <div class="form-group">
                                    <label class="col-sm-12">选择课程</label>
                                    <div class="col-sm-12">
                                        <select id="courseSelect" class="form-control form-control-line">
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12">课程地点</label>
                                    <div class="col-md-12">
                                        <input id="courseSite" name="courseSite" type="text" placeholder="输入课程地点"
                                               class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">课程时间</label>
                                    <div id="coursseDay" class="col-md-12">
                                        周一
                                    </div>
                                    <br />
                                    <div id="courseSection" class="col-md-12">
                                        <input name="classCheckbox" value="class_1_1_2" type="checkbox"> 1,2节
                                        <input name="classCheckbox" value="class_1_3_4" type="checkbox"> 3,4节
                                        <input name="classCheckbox" value="class_1_5_6" type="checkbox"> 5,6节
                                        <input name="classCheckbox" value="class_1_7_8" type="checkbox"> 7,8节
                                    </div>

                                    <div id="coursseDay" class="col-md-12">
                                        周二
                                    </div>
                                    <br />
                                    <div id="courseSection" class="col-md-12">
                                        <input name="siteCheckbox" value="class_2_1_2" type="checkbox"> 1,2节
                                        <input name="siteCheckbox" value="class_2_3_4" type="checkbox"> 3,4节
                                        <input name="siteCheckbox" value="class_2_5_6" type="checkbox"> 5,6节
                                        <input name="siteCheckbox" value="class_2_7_8" type="checkbox"> 7,8节
                                    </div>

                                    <div id="coursseDay" class="col-md-12">
                                        周三
                                    </div>
                                    <br />
                                    <div id="courseSection" class="col-md-12">
                                        <input name="siteCheckbox" value="class_3_1_2" type="checkbox"> 1,2节
                                        <input name="siteCheckbox" value="class_3_3_4" type="checkbox"> 3,4节
                                        <input name="siteCheckbox" value="class_3_5_6" type="checkbox"> 5,6节
                                        <input name="siteCheckbox" value="class_3_7_8" type="checkbox"> 7,8节
                                    </div>

                                    <div id="coursseDay" class="col-md-12">
                                        周四
                                    </div>
                                    <br />
                                    <div id="courseSection" class="col-md-12">
                                        <input name="siteCheckbox" value="class_4_1_2" type="checkbox"> 1,2节
                                        <input name="siteCheckbox" value="class_4_3_4" type="checkbox"> 3,4节
                                        <input name="siteCheckbox" value="class_4_5_6" type="checkbox"> 5,6节
                                        <input name="siteCheckbox" value="class_4_7_8" type="checkbox"> 7,8节
                                    </div>

                                    <div id="coursseDay" class="col-md-12">
                                        周五
                                    </div>
                                    <br />
                                    <div id="courseSection" class="col-md-12">
                                        <input name="siteCheckbox" value="class_5_1_2" type="checkbox"> 1,2节
                                        <input name="siteCheckbox" value="class_5_3_4" type="checkbox"> 3,4节
                                        <input name="siteCheckbox" value="class_5_5_6" type="checkbox"> 5,6节
                                        <input name="siteCheckbox" value="class_5_7_8" type="checkbox"> 7,8节
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-12">选择班级</label>
                                    <div class="col-sm-12">
                                        <select id="departSelect" class="form-control form-control-line">
                                            <option selected="selected" style="display: none;">请选择学院</option>
                                        </select>

                                        <select id="majorSelect" class="form-control form-control-line">
                                            <option selected="selected" style="display: none;">请选择专业</option>
                                        </select>

                                        <div id="classSelect" class="form-control form-control-line">
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success" onclick="makeClass()">创建课程</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="/jquery/jquery-cookie/jquery.cookie.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/teachback/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="/teachback/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/teachback/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/teachback/js/custom.min.js"></script>
    <script>
        var account = {};
        var course = {};
        var departSelect = {};
        var teachCourse = {};
        $(function () {
            teachInfo();
            courseQuery();
            departQuery();
            // teachCourseQuery();
        });

        function makeClass(){
            let selectMajor = $("#majorSelect");
            let classFormSelect = [];
            classFormSelect.push("course", $("#courseSelect option:selected").val());
            console.log($("#courseSelect option:selected").val());
            console.log($("#courseSite").val());
            classFormSelect.push("courseSite", $("#courseSite").val());

            let siteCheckbox = [];
            $.each($('input:checkbox[name=classCheckbox]:checked'),function(){
                siteCheckbox.push($(this).val());
                console.log("你选了："+
                    $('input[type=Checkbox]:checked').length+"个，其中有："+$(this).val());
            });
            classFormSelect.push("siteCheckbox", siteCheckbox);

            classFormSelect.push("major", selectMajor.selectedIndex);

            let classCheckbox = [];
            $.each($('input:checkbox[name=classCheckbox]:checked'),function () {
                classCheckbox.push($(this).val());
            });
            classFormSelect.push("classFormSelect",classCheckbox)

            $.ajax({
                type:"post",
                data:classFormSelect,
                url: "/makeClass",
                async: false,
                processData: false,
                contentType: false,
                success:function (data) {
                    alert("asd");
                },
                error:function () {
                    alert("创建课程失败！");
                }
            })

        }
        $("#departSelect").on("change", function () {
            departId = $("option:selected",this).val();//需求主键
            majorQuery(departId);
        });

        $("#majorSelect").on("change", function () {
            console.log("major click")
            majorId = $("option:selected",this).val();//需求主键
            classQuery(majorId);
        });
        function classQuery(majorId) {
            console.log(majorId);
            $.ajax({
                type:"post",
                data: {"majorId":majorId},
                url: "/classQuery",
                success:function (data) {
                    let classSelect = $("#classSelect");
                    classSelect.empty();
                    for (let i = 0; i < data.length; i++) {
                        classSelect.append("<input name='classSelectCheckbox' value=" + data[i].classId + " type=\"checkbox\"> " + data[i].classId);
                    }
                },
                error:function () {
                    alert("班级查询失败！");
                }
            })
        }

        function majorQuery(departId) {
            console.log(departId);
            $.ajax({
                type: "post",
                url: "/majorQuery",
                data: {'departId':departId},
                success: function (data) {
                    let majorSelect = $("#majorSelect");
                    for (let i = 0; i < data.length; i++) {
                        majorSelect.append("<option value=" + data[i].majorId + ">" +  data[i].majorName + "</option>");
                    };
                },
                error: function () {
                    alert("学院查询错误！")
                }
            })
        }
        function departQuery() {
            $.ajax({
                type: "post",
                url: "/departQuery",
                success: function (data) {
                    let departSelect = $("#departSelect");
                    for (let i = 0; i < data.length; i++) {
                        departSelect.append("<option value=" + data[i].departId + ">" +  data[i].departName + "</option>");
                    }
                },
                error: function () {
                    alert("专业查询错误！")
                }
            })

        }
        function courseQuery(){
            $.ajax({
                type: "post",
                url: "/courseQuery",
                success: function (data) {
                    let courseSelect = $("#courseSelect");
                    course = data;
                    console.log(data);
                    for (let i = 0; i < course.length; i++) {
                        courseSelect.append("<option value=" + course[i].courseId + ">" +  course[i].courseName + "</option>");
                    }
                },
                error: function () {
                    alert("课程查询错误！")
                }
            })
        }
        function teachCourseQuery(){
            let teachInfo = new FormData;
            teachInfo.append("teachId", $.cookie("teachId"));
            $.ajax({
                type: "post",
                url: "/teachCourseQuery",
                data: teachInfo,
                contentType: false,
                processData: false,
                async: false,
                success: function (data) {

                },
                error: function () {
                    alert("课程查询错误！")
                }
            })
        }


        function teachInfo() {
            let teachInfo = new FormData;
            teachInfo.append("teachId", $.cookie("teachId"));
            $.ajax({
                type: "post",
                url: "/teachInfoQuery",
                data: teachInfo,
                contentType: false,
                processData: false,
                async: false,
                success: function (data) {
                    // account = data;
                    account.teachId = data.teachId;
                    account.teachName = data.teachName;
                    account.teachSex = data.teachSex;
                    account.teachSchool = data.teachSchool;
                    account.teachDepart = data.teachDepart;
                    account.teachMajor = data.teachMajor;
                    account.teachGrade = data.teachGrade;
                    account.teachTitle = data.teachTitle;
                    account.teachPhone = data.teachPhone;

                    $("#teachId").val(data.teachId);
                    $("#teachName").val(data.teachSex);
                    $("#teachSex").val(data.teachSex);
                    $("#teachSchool").val(data.teachSchool);
                    $("#teachDepart").val(data.teachDepart);
                    $("#teachMajor").val(data.teachMajor);
                    $("#teachGrade").val(data.teachGrade);
                    $("#teachTitle").val(data.teachTitle);
                    $("#teachPhone").val(data.teachPhone);
                },
                error: function () {
                    alert("错误！")
                }
            })
        }
    </script>
</body>

</html>