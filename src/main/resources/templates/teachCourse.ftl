<!DOCTYPE html>
<html lang="en">

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
                            <form class="form-horizontal form-material">
                                <div class="form-group">
                                    <label class="col-sm-12">选择课程</label>
                                    <div class="col-sm-12">
                                        <select id="courseSelect" class="form-control form-control-line">
                                            <option>London</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">课程名</label>
                                    <div class="col-md-12">
                                        <input name="courseName" type="text" placeholder="Johnathan Doe"
                                               class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="example-email" class="col-md-12"></label>
                                    <div class="col-md-12">
                                        <input type="email" placeholder="johnathan@admin.com"
                                               class="form-control form-control-line" name="example-email"
                                               id="example-email"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input type="password" value="password" class="form-control form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Phone No</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="123 456 7890"
                                               class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Message</label>
                                    <div class="col-md-12">
                                        <textarea rows="5" class="form-control form-control-line"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12">Select Country</label>
                                    <div class="col-sm-12">
                                        <select class="form-control form-control-line">
                                            <option>London</option>
                                            <option>India</option>
                                            <option>Usa</option>
                                            <option>Canada</option>
                                            <option>Thailand</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button class="btn btn-success">Update Profile</button>
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
        var teachCourse = {};
        $(function () {
            teachInfo();
            courseQuery();
            // teachCourseQuery();
        });
        function courseQuery(){
            $.ajax({
                type: "post",
                url: "/courseQuery",
                success: function (data) {
                    alert(data[0].course_id);
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