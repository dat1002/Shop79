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
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/simplePagination.css"/>
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
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed;">
    <!-- Brand Logo -->
    <a href="../../index.html" class="brand-link">
      <img src="${base}/images/b.png"
           alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${base}/images/b.png" class="img-circle elevation-2" alt="User Image">
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
      <div class="list-product mt-5" id="" style="width: 100%;">
        <h1 class="text-primary">Product List</h1>
        <form class="form-inline" id="list-product" action="${base }/admin/product/addOrUpdate" method="get">
            <div class="d-flex flex-row">
                <!-- dữ liệu để thực hiện tìm kiếm sản phẩm -->
                <input type="hidden" id="page" name="page">
                <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }">
                <select class="form-control"  name="categoryId" id="categoryId">
                    <option class="dropdown-item" href="${base }/">All Products</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id }">${category.name }</option>
                    </c:forEach>
                </select>
                <button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button>
            </div>
        </form>
        <form id="" name="" action="${base}/admin/product/list" method="GET" modelAttribute="products">
                  <table class=" mb-5" id="table-product">
                    <tr>
                      <th style="width: 5%">
                        #
                      </th>
                      <th>
                        Title
                      </th>
                      <th>
                        Price
                      </th>
                      <th>
                        Category
                      </th>
                      <th>
                        Status
                      </th>
                      <th>
                        Avatar
                      </th>
                      <th>
                        Action
                      </th>
                    </tr>
                    <c:forEach items="${productsWithPaging.data}" var="product" varStatus="loop">
                      <tr>
                        <td>${product.id}</td>
                        <td>${product.title}</td>
                        <td>
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price }" type="currency" />
                        </td>
                        <td>${product.categories.name}</td>
                        <td>${product.status}</td>
                        <td><img src="${base}/upload/${product.avatar}" width="60" height="90" alt=""></td>
                        <td>
                          <a class="btn btn-primary" href="/admin/product/edit/${product.id}">Edit</a>
                          <a class="btn btn-danger"  href="/admin/product/delete/${product.id}">Delete</a>
                          </td>
                      </tr>
                    </c:forEach>
                  </table>
                  <!-- Paging -->
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                            <div id="paging"></div>
                        </div>
                    </div>
                </form>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.simplePagination.js"></script>
<script>
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
  <script type="text/javascript">
      $( document ).ready(function() {
          $("#paging").pagination({
              currentPage: ${productsWithPaging.currentPage},
              items: ${productsWithPaging.totalItems},
              itemsOnPage: 5,
              cssStyle: 'dark-theme',
              onPageClick: function(pageNumber, event) {
                  $('#page').val(pageNumber);
                  $('#btnSearch').trigger('click');
              },
          });
      });
  </script>
</body>
</html>
