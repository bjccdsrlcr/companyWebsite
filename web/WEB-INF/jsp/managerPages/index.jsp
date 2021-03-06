<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>优普网站管理后台</title>
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/plugins/wangEditor/wangEditor.min.css" />
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/bootstrap.css" />
    <link rel="stylesheet" href="/resources/plugins/Summernote/css/summernote.css" />
    <link rel="stylesheet" type="text/css" href="/resources/plugins/Summernote/css/summernote-bs3.css" />
</head>

<body class="skin-blue sidebar-mini fixed">
<div class="wrapper">
    <header class="main-header">
        <a href="/index/indexPage" class="logo">
            <span class="logo-mini">优普</span>
            <span class="logo-lg">UNIPOWER</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image" />
                            <span class="hidden-xs">${sessionScope.get("username")}</span>
                        </a>
                        <ul class="dropdown-menu" style="width: auto;">
                            <li>
                                <a href="/resources/pages/login.html" class="btn btn-default btn-flat">退出登录</a>
                            </li>
                        </ul>
                    </li>
                    <li class="hidden">
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 菜单栏 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <!-- 搜索 -->
            <form action="#" method="get" class="sidebar-form hidden">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search..." />
                    <span class="input-group-btn">
				                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
				            </span>
                </div>
            </form>
            <!--菜单 -->
            <ul class="sidebar-menu">
                <!--<li class="active">
                    <a href="javascript:;" onclick="menu('pages/table.html')">
                        <i class="fa fa-th"></i> <span>菜单管理</span>
                    </a>
                </li>-->
                <li>
                    <a href="javascript:;" onclick="menu('/newsType/newsTypeList')">
                        <i class="fa fa-tags"></i> <span>新闻类别</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" onclick="menu('/news/newsAllList')">
                        <i class="fa fa-newspaper-o"></i> <span>新闻管理</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" onclick="menu('/comments/commentList')">
                        <i class="fa fa-comments"></i> <span>评论管理</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" onclick="menu('/products/productList')">
                        <i class="fa fa-laptop"></i> <span>产品管理</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" onclick="menu('/solutions/solutionManageList')">
                        <i class="fa fa-laptop"></i> <span>解决方案管理</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <div class="content-wrapper">
        <section class="content-header" id="page-title">
            <h1>Dashboard<small>Control panel</small></h1>
            <ol class="breadcrumb hidden">
                <li>
                    <a href="#"><i class="fa fa-dashboard"></i> Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <section class="content"></section>
    </div>
    <footer class="main-footer hidden">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://www.mycodes.net">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li>
                <a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a>
            </li>

            <li>
                <a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript::;'>
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <i class="menu-icon fa fa-user bg-yellow"></i>
                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>
                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript::;'>
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>
                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>
                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-waring pull-right">50%</span>
                            </h4>
                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript::;'>
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>
                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>
                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked />
                        </label>
                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked />
                        </label>
                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked />
                        </label>
                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked />
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right" />
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class='control-sidebar-bg'></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.1.4 -->
<script src="/resources/script/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/dist/js/moment.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/script/wangEditor.min.js"></script>
<script src="/resources/script/jquery.form.js"></script>
<script src="/resources/script/bootstrap.js"></script>
<script src="/resources/plugins/Summernote/js/summernote.min.js"></script>
<script src="/resources/plugins/Summernote/js/summernote-zh-CN.js"></script>
<script>
    $('.sidebar-menu').on('click','li',function(){
        $(this).addClass('active').siblings('li').removeClass('active');
        $('#page-title h1').html($(this).find('span').text())
    })
    $('.sidebar-menu').find('li:first a').trigger('click');
    function menu(href){
        $('.content').load(href);
    }

</script>
</body>

</html>
