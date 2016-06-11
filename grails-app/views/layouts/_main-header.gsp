<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><g:meta name="info.app.displayName"/></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><g:meta name="info.app.displayName"/></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                %{--<li class="dropdown messages-menu">--}%
                %{--<!-- Menu toggle button -->--}%
                %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--}%
                %{--<i class="fa fa-envelope-o"></i>--}%
                %{--<span class="label label-success">4</span>--}%
                %{--</a>--}%
                %{--<ul class="dropdown-menu">--}%
                %{--<li class="header">你有 4 条消息</li>--}%
                %{--<li>--}%
                %{--<!-- inner menu: contains the messages -->--}%
                %{--<ul class="menu">--}%
                %{--<li><!-- start message -->--}%
                %{--<a href="#">--}%
                %{--<div class="pull-left">--}%
                %{--<!-- User Image -->--}%
                %{--<img src="${resource(dir: 'assets/img', file: 'avatar5.png')}" class="img-circle" alt="User Image">--}%
                %{--</div>--}%
                %{--<!-- Message title and timestamp -->--}%
                %{--<h4>--}%
                %{--有订单需要发货--}%
                %{--<small><i class="fa fa-clock-o"></i> 5 分钟</small>--}%
                %{--</h4>--}%
                %{--<!-- The message -->--}%
                %{--<p>今天订单增加了许多，需要及时处理</p>--}%
                %{--</a>--}%
                %{--</li><!-- end message -->--}%
                %{--</ul><!-- /.menu -->--}%
                %{--</li>--}%
                %{--<li class="footer"><a href="#">查看所有消息</a></li>--}%
                %{--</ul>--}%
                %{--</li><!-- /.messages-menu -->--}%

                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">用户中心</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                            <p>
                                胡新强 - Web Developer
                                <small>个人简介信息</small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="col-xs-4 text-center">
                                <a href="#">等级</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">积分</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">推广</a>
                            </div>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">设置</a>
                            </div>
                            <div class="pull-right">
                                <a href="#" class="btn btn-default btn-flat" >退出</a>
                                %{--<button type="button" class="btn btn-default btn-flat" onclick="logout()">退出</button>--}%
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

%{--<script>--}%
    %{--function logout(){--}%
        %{--$.post("/work/accountInfo/logout",null, function (bdata) {--}%
            %{--if(bdata.status!="success"){--}%
                %{--bootbox.alert("退出失败！")--}%
            %{--}else{--}%
                %{--window.location="/work/login/index";--}%
            %{--}--}%
        %{--},"json");--}%
    %{--}--}%

%{--</script>--}%