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
  <title>AdminLTE 3 | ChartJS</title>
    <!-- Common -->
   <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <!--
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
   <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="${base}/css/adminlte.min.css">
    <link rel="stylesheet" href="${base}/css/them.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index.html" class="brand-link">
      <img src="../../dist/img/AdminLTELogo.png"
           alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
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
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Chỉnh sửa danh mục

                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="them.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Thêm</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sua.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sửa</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="xoa.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Xóa</p>
                </a>
              </li>
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
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Thêm</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content d-block" style="width: 100%;">
     <div class="insert    m-auto" style="width: 70%;">
        <sf:form class="p-2 form-insert-product" id="product" name="product" action="${base}/product" method="POST" style="border-radius: 5px; border: solid 1px #ccc; width: 100%;" modelAttribute="product">
          <sf:hidden path="id"/>
          <b class="m-2">Thông tin sản phẩm</b>
          <ul style="list-style-type: none">
            <li class="d-flex">
              <div class="">
                Mã sản phẩm <br>
                <sf:input type="text" id="id" name="id" path="id" style="border-radius: 5px; border: solid 1px #ccc;"></sf:input>
              </div>
              <div class style="padding-left: 25%;">
                Tên sản phẩm <br>
                <sf:input type="text"  id="title" name="title" path="title" style="border-radius: 5px; border: solid 1px #ccc;"></sf:input>
              </div>
            </li>
          </ul>
          <ul style="list-style-type: none">
           <li>
             Ảnh sản phẩm
           </li>
           <li class="img-1">
             <img class="abcx" id="anh" src="." alt="" width="20%" height="10%">
             <p class="mt-2">Đường dẫn hình ảnh</p>
             <sf:input type="text" class="avatar" id="avatar" name="avatar" path="avatar" style="width: 65%" value="" ></sf:input>
             <button type="button" action="" class="check-img">Xem ảnh</button>
           </li>
          </ul>
          <ul style="list-style-type: none">
           <li>
             Danh mục sản phẩm
           </li>
           <li class="d-block">
             <table>
               <tr class="">
                 <td class="pr-4">
                   <input class="mr-2" path="" type="checkbox">Sản phẩm mới</input>
                 </td>
                 <td class="pr-4">
                   <input class="mr-2" type="checkbox">Phụ kiện</input>
                 </td>
                 <td class="pr-4">
                  <input class="mr-2" type="checkbox">Áo nữ</input>
                </td>
                 <td class="pr-4">
                   <input class="mr-2" type="checkbox">Áo Nam</input>
                 </td>
                 <td class="pr-4">
                   <input class="mr-2" type="checkbox">Quần nam</input>
                 </td>
               </tr>
             </table>
           </li>
          </ul>
          <ul style="list-style-type: none">
           <li>
             Giá sản phẩm
           </li>
           <li>
             <table>
               <tr>
                 <td>Giá nhập</td>
                 <td>Giá bán</td>
                 <td>Giảm giá</td>
               </tr>
               <tr>
                 <td>
                   <sf:input class="mr-4" type="text" id="price" name="price" path="price" style="border-radius: 5px; border: solid 1px #ccc; width: 70%;" placeholder="VND"></sf:input>
                 </td>
                 <td>
                   <sf:input class="mr-4" type="text" path="" style="border-radius: 5px; border: solid 1px #ccc; width: 70%;" placeholder="VND"></sf:input>
                 </td>
                 <td>
                   <sf:input class="mr-4" type="text" id="priceSale" name="priceSale" path="priceSale" style="border-radius: 5px; border: solid 1px #ccc; width: 70%;" placeholder="%"></sf:input>
                 </td>
               </tr>
             </table>
           </li>
          </ul>
          <ul style="list-style-type: none">
           <li>
             <table>
               <tr>
                 <td>Số lượng</td>
                 <td>Màu sắc</td>
                 <td>kích Thước</td>
               </tr>
               <tr>
                 <td>
                   <sf:input class="mr-4" id="details" name="details" path="details" type="number" style="border-radius: 5px; border: solid 1px #ccc; width: 70%;"></sf:input>
                 </td>
                 <td>
                   <sf:input class="mr-4" type="text" id="shortDes" name="shortDes" path="shortDes" style="border-radius: 5px; border: solid 1px #ccc; width: 70%;"></sf:input>
                 </td>
                 <td>
                   <sf:select name="" id="" path="">
                     <option value="">S</option>
                     <option value="">M</option>
                     <option value="">L</option>
                     <option value="">XL</option>
                     <option value="">XXL</option>
                   </sf:select>
                 </td>
               </tr>
             </table>
           </li>
          </ul>
          <ul style="list-style-type: none">
           <li>
            Mô tả
           </li>
           <li>
             <textarea name="" id="" rows="5" style="width:77%;"></textarea>
           </li>
          </ul>
          <button type="submit" id="" click="add()" class="add-product pr-4 pl-4" style="margin-left: 40%;"><b>Lưu</b></button>
         </sf:form>
      </div>
      <div class="list-product mt-5" id="" style="width: 100%;">
        <b>QUẢN LÝ SẢN PHẨM</b>
        <table class=" mb-5" id="table-product">
          <tr>
            <th rowspan="2" width="4%">
              STT
            </th>
            <th rowspan="2" width="10%">
              Mã SP
            </th>
            <th rowspan="2" width="10%">
              Tên SP
            </th>
            <th rowspan="2" width="10%">
              Ảnh
            </th>
            <th rowspan="2" width="10%">
              Danh mục SP
            </th>
            <th colspan="3">
              Giá
            </th>
            <th rowspan="2" width="5%">
              Số Lượng
            </th>
            <th rowspan="2" width="5%">
              Màu sắc
            </th>
            <th rowspan="2" width="5%">
              Kích thước
            </th>
            <th rowspan="2" width="10%">
              Mô tả
            </th>
            <th rowspan="2" width="10%">
              Sửa/Xóa
            </th>
          </tr>
          <tr>
            <th width="6%">Giá nhập (VND)</th>
            <th width="6%">Giá bán (VND)</th>
            <th width="5%">Sale (%)</th>
          </tr>
            <td class='stt'>1</td>
            <td id="maSP">SP001</td>
            <td>Sản phẩm 01</td>
            <td><img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2917202131755_1.jpg" width="50px" alt=""></td>
            <td>Sản phẩm mới</td>
            <td>50000</td>
            <td>200000</td>
            <td>10</td>
            <td>100</td>
            <td>Đỏ</td>
            <td>XL</td>
            <td>Hàng VN Chất lượng trung quốc</td>
            <td class="">
                <button type="button" onclick="edit()" class="edit" id="" >Sửa</button>
                <button type="button" class="delete" id="" >Xóa</button>
            </td>
            </tr>
        </table>
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </nav>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      
    </div>
    
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Add Content Here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${pageContext.servletContext.contextPath}/js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.servletContext.contextPath}/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.servletContext.contextPath}/js/demo.js"></script>
<!-- Page specific script -->
<script src="${pageContext.servletContext.contextPath}/js/them.js"></script>
<script>
    $(document).on('click', '.check-img', function(){
      var imgId = $(document).find('.img-1 .avatar').val();
      console.log(imgId);
      $(document).find('.abcx').attr('src', imgId);
    })
</script>
</body>
</html>
