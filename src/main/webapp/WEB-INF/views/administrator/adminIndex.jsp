<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- taglib JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <!-- taglib SPRING-FORM -->
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin</title>
    <!-- Common -->
   <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- main header -->
    <jsp:include page="/WEB-INF/views/administrator/layout/mainHeader.jsp"></jsp:include>


  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed;">
    <!-- Brand Logo -->
    <a href="${base}/admin/index" class="brand-link">
      <img src="https://scontent.fhph1-1.fna.fbcdn.net/v/t1.15752-9/247729728_408779057295755_8639715181656924551_n.png?_nc_cat=110&ccb=1-5&_nc_sid=ae9488&_nc_ohc=4P3Lfot9BBEAX8Ha_Nl&tn=2GpMd1ZTbXXpCTM9&_nc_ht=scontent.fhph1-1.fna&oh=bdc4028e2af3c318c777132c68d009e7&oe=619D74C7"
           alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Shop 79</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="https://scontent.fhph1-3.fna.fbcdn.net/v/t1.15752-9/248412489_288159403005888_7880662474556592677_n.png?_nc_cat=102&ccb=1-5&_nc_sid=ae9488&_nc_ohc=EZUaw8ajX0gAX8CJlOT&_nc_ht=scontent.fhph1-3.fna&oh=dbca15c9614882f728948617c47796da&oe=61A0C41B" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${userLogined.nameUser}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-close">
            <a href="#" class="nav-link active">
              <i class="fas fa-check-circle mr-1"></i>
              <p>
                Select
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${base}/admin/category/addOrUpdate" class="nav-link">
                  <i class="fas fa-list nav-icon"></i>
                  <p>Category </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${base}/admin/product/addOrUpdate" class="nav-link">
                  <i class="fab fa-product-hunt nav-icon"></i>
                  <p> Product </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${base}/admin/product/productDetails" class="nav-link">
                  <i class="fas fa-info-circle nav-icon"></i></i>
                  <p> Product Details </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${base}/admin/saleOrderManagement" class="nav-link">
                  <i class="fal fa-clipboard-list nav-icon"></i>
                  <p>The Order </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${base}/admin/user/addOrUpdate" class="nav-link">
                  <i class="fad fa-users nav-icon"></i>
                  <p>User </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${base}/admin/role/addOrUpdate" class="nav-link">
                  <i class="fas fa-user-tag nav-icon"></i>
                  <p>Role </p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content d-block" style="width: 100%;">
     <div class="content">
           <div class="container-fluid">
             <div class="row">
               <div class="col-lg-6">
                 <div class="card">
                   <div class="card-header border-0">
                     <div class="d-flex justify-content-between">
                       <h3 class="card-title">Online Store Visitors</h3>
                       <a href="javascript:void(0);">View Report</a>
                     </div>
                   </div>
                   <div class="card-body">
                     <div class="d-flex">
                       <p class="d-flex flex-column">
                         <span class="text-bold text-lg">820</span>
                         <span>Visitors Over Time</span>
                       </p>
                       <p class="ml-auto d-flex flex-column text-right">
                         <span class="text-success">
                           <i class="fas fa-arrow-up"></i> 12.5%
                         </span>
                         <span class="text-muted">Since last week</span>
                       </p>
                     </div>
                     <!-- /.d-flex -->

                     <div class="position-relative mb-4">
                       <canvas id="visitors-chart" height="200"></canvas>
                     </div>

                     <div class="d-flex flex-row justify-content-end">
                       <span class="mr-2">
                         <i class="fas fa-square text-primary"></i> This Week
                       </span>

                       <span>
                         <i class="fas fa-square text-gray"></i> Last Week
                       </span>
                     </div>
                   </div>
                 </div>
                 <!-- /.card -->

                 <div class="card">
                   <div class="card-header border-0">
                     <h3 class="card-title">Products</h3>
                     <div class="card-tools">
                       <a href="#" class="btn btn-tool btn-sm">
                         <i class="fas fa-download"></i>
                       </a>
                       <a href="#" class="btn btn-tool btn-sm">
                         <i class="fas fa-bars"></i>
                       </a>
                     </div>
                   </div>
                   <div class="card-body table-responsive p-0">
                     <table class="table table-striped table-valign-middle">
                       <thead>
                       <tr>
                         <th>Product</th>
                         <th>Price</th>
                         <th>Sales</th>
                         <th>More</th>
                       </tr>
                       </thead>
                       <tbody>
                       <tr>
                         <td>
                           <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                           Some Product
                         </td>
                         <td>$13 USD</td>
                         <td>
                           <small class="text-success mr-1">
                             <i class="fas fa-arrow-up"></i>
                             12%
                           </small>
                           12,000 Sold
                         </td>
                         <td>
                           <a href="#" class="text-muted">
                             <i class="fas fa-search"></i>
                           </a>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                           Another Product
                         </td>
                         <td>$29 USD</td>
                         <td>
                           <small class="text-warning mr-1">
                             <i class="fas fa-arrow-down"></i>
                             0.5%
                           </small>
                           123,234 Sold
                         </td>
                         <td>
                           <a href="#" class="text-muted">
                             <i class="fas fa-search"></i>
                           </a>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                           Amazing Product
                         </td>
                         <td>$1,230 USD</td>
                         <td>
                           <small class="text-danger mr-1">
                             <i class="fas fa-arrow-down"></i>
                             3%
                           </small>
                           198 Sold
                         </td>
                         <td>
                           <a href="#" class="text-muted">
                             <i class="fas fa-search"></i>
                           </a>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                           Perfect Item
                           <span class="badge bg-danger">NEW</span>
                         </td>
                         <td>$199 USD</td>
                         <td>
                           <small class="text-success mr-1">
                             <i class="fas fa-arrow-up"></i>
                             63%
                           </small>
                           87 Sold
                         </td>
                         <td>
                           <a href="#" class="text-muted">
                             <i class="fas fa-search"></i>
                           </a>
                         </td>
                       </tr>
                       </tbody>
                     </table>
                   </div>
                 </div>
                 <!-- /.card -->
               </div>
               <!-- /.col-md-6 -->
               <div class="col-lg-6">
                 <div class="card">
                   <div class="card-header border-0">
                     <div class="d-flex justify-content-between">
                       <h3 class="card-title">Sales</h3>
                       <a href="javascript:void(0);">View Report</a>
                     </div>
                   </div>
                   <div class="card-body">
                     <div class="d-flex">
                       <p class="d-flex flex-column">
                         <span class="text-bold text-lg">$18,230.00</span>
                         <span>Sales Over Time</span>
                       </p>
                       <p class="ml-auto d-flex flex-column text-right">
                         <span class="text-success">
                           <i class="fas fa-arrow-up"></i> 33.1%
                         </span>
                         <span class="text-muted">Since last month</span>
                       </p>
                     </div>
                     <!-- /.d-flex -->

                     <div class="position-relative mb-4">
                       <canvas id="sales-chart" height="200"></canvas>
                     </div>

                     <div class="d-flex flex-row justify-content-end">
                       <span class="mr-2">
                         <i class="fas fa-square text-primary"></i> This year
                       </span>

                       <span>
                         <i class="fas fa-square text-gray"></i> Last year
                       </span>
                     </div>
                   </div>
                 </div>
                 <!-- /.card -->

                 <div class="card">
                   <div class="card-header border-0">
                     <h3 class="card-title">Online Store Overview</h3>
                     <div class="card-tools">
                       <a href="#" class="btn btn-sm btn-tool">
                         <i class="fas fa-download"></i>
                       </a>
                       <a href="#" class="btn btn-sm btn-tool">
                         <i class="fas fa-bars"></i>
                       </a>
                     </div>
                   </div>
                   <div class="card-body">
                     <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                       <p class="text-success text-xl">
                         <i class="ion ion-ios-refresh-empty"></i>
                       </p>
                       <p class="d-flex flex-column text-right">
                         <span class="font-weight-bold">
                           <i class="ion ion-android-arrow-up text-success"></i> 12%
                         </span>
                         <span class="text-muted">CONVERSION RATE</span>
                       </p>
                     </div>
                     <!-- /.d-flex -->
                     <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                       <p class="text-warning text-xl">
                         <i class="ion ion-ios-cart-outline"></i>
                       </p>
                       <p class="d-flex flex-column text-right">
                         <span class="font-weight-bold">
                           <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                         </span>
                         <span class="text-muted">SALES RATE</span>
                       </p>
                     </div>
                     <!-- /.d-flex -->
                     <div class="d-flex justify-content-between align-items-center mb-0">
                       <p class="text-danger text-xl">
                         <i class="ion ion-ios-people-outline"></i>
                       </p>
                       <p class="d-flex flex-column text-right">
                         <span class="font-weight-bold">
                           <i class="ion ion-android-arrow-down text-danger"></i> 1%
                         </span>
                         <span class="text-muted">REGISTRATION RATE</span>
                       </p>
                     </div>
                     <!-- /.d-flex -->
                   </div>
                 </div>
               </div>
               <!-- /.col-md-6 -->
             </div>
             <!-- /.row -->
           </div>
           <!-- /.container-fluid -->
         </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">

    </div>

  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>
