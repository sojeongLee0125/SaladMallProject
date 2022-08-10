<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title> SaladMall | AdminPage </title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath }/resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath }/resources/admin/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath }/resources/admin/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/resources/admin/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <body class="skin-green-light sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath }/main" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini">Open</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>SaladMall</b> Admin </span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/chunsik.jpg" class="img-circle" alt="User Image"/>
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>배송이 안되서 고객불만이 폭발!!!!</p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/apeach.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>디자인 팀장님 최고에요!!!</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/chunsik.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>코딩하는데 당이 딸립니다.</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/apeach.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>판매량 저조 이러다 곧 망할듯..</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath }/resources/admin/dist/img/chunsik.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p>집가고싶다. 이미 집이지만.</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-red"></i> 5 new members joined
                        </a>
                      </li>

                      <li>
                        <a href="#">
                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-user text-red"></i> You changed your username
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Create a nice theme
                            <small class="pull-right">40%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">40% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Some task I need to do
                            <small class="pull-right">60%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">60% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Make beautiful transitions
                            <small class="pull-right">80%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">80% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="${pageContext.request.contextPath }/resources/admin/dist/img/main_img.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">admin</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="${pageContext.request.contextPath }/resources/admin/dist/img/main_img.jpg" class="img-circle" alt="User Image" />
                    <p>
                      Lee Chunsik - Administrator
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="${pageContext.request.contextPath }/M_Login/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="${pageContext.request.contextPath }/resources/admin/dist/img/main_img.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Lee Chunsik</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
	            <li class="treeview">
	              <a href="#">
	                <i class="fa fa-dashboard"></i> <span>고객관리</span> <i class="fa fa-angle-left pull-right"></i>
	              </a>
	              <ul class="treeview-menu">
	                <li><a href="${pageContext.request.contextPath }/Admin/mListAll"><i class="fa fa-circle-o"></i> 고객 정보 </a></li>
	                <li><a href="${pageContext.request.contextPath }/Admin/oListAll"><i class="fa fa-circle-o"></i> 주문 정보 </a></li>
	            </ul>
	            </li>
	             <li class="treeview">
	              <a href="#">
	                <i class="fa fa-dashboard"></i> <span>상품관리</span> <i class="fa fa-angle-left pull-right"></i>
	              </a>
	              <ul class="treeview-menu">
	                <li><a href="${pageContext.request.contextPath }/Admin/igdtListAll"><i class="fa fa-circle-o"></i> 재료 재고 정보 </a></li>
	                <li><a href="${pageContext.request.contextPath }/Admin/igdtRegister"><i class="fa fa-circle-o"></i> 샐러드 재료 등록 </a></li>
	            </ul>
	            </li>
	            <li class="treeview">
	              <a href="#">
	                <i class="fa fa-dashboard"></i> <span>쿠폰관리</span> <i class="fa fa-angle-left pull-right"></i>
	              </a>
	              <ul class="treeview-menu">
	                <li><a href="${pageContext.request.contextPath }/Admin/couponListAll"><i class="fa fa-circle-o"></i> 쿠폰 정보 </a></li>
	              </ul>
	            </li>
	            <li class="treeview">
	              <a href="#">
	                <i class="fa fa-dashboard"></i> <span>판매 성향 분석</span> <i class="fa fa-angle-left pull-right"></i>
	              </a>
	              <ul class="treeview-menu">
	                <li><a href="${pageContext.request.contextPath }/Admin/RBoard_TopList"><i class="fa fa-circle-o"></i> 주간 레시피 TOP 10 </a></li>
	                <li><a href="${pageContext.request.contextPath }/Admin/Salad_TopList"><i class="fa fa-circle-o"></i> 주간 샐러드 TOP 10 </a></li>
	              </ul>
	            </li>
            <li class="header">LABELS</li>
            <li><a return "${pageContext.request.contextPath }/index"><i class="fa fa-circle-o text-red"></i> <span>샐러드몰 이동</span></a></li>
            <li><a return "${pageContext.request.contextPath }/R_Board/boardList"><i class="fa fa-circle-o text-yellow"></i> <span>레시피 게시판 이동</span></a></li>
            <li><a return "${pageContext.request.contextPath }/CS/listAll"><i class="fa fa-circle-o text-aqua"></i> <span>고객 게시판 이동</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            SaladMall Admin Program
            <small>Overview</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">main</a></li>
            <li class="active">administration</li>
          </ol>
        </section>