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
          <li class="nav-item menu-open">
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
                <a href="${base}/admin/product/addOrUpdate" class="nav-link active">
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
     <div class="m-auto" style="width: 70%;">
        <sf:form class="p-2 form-add-product" id="product" name="product" action="${base}/admin/product/addOrUpdate" method="POST" modelAttribute="product" enctype="multipart/form-data" style="border-radius: 5px; border: solid 1px #ccc; width: 100%;">
          <!-- Xác định là thêm mới hay chỉnh sửa -->
          <sf:hidden path="id"/>
          <h1 class="mt-3" style="text-align: center; font-weight: 500; color: rgb(100, 87, 87);">Add/Update Product</h1>
            <div class="form-add-update-product">
              <div class="form-group">
                <label for="category">Category</label><br>
                <sf:select path="categories.id" class="form-control" id="category">
                  <sf:options items="${categories}" itemValue="id" itemLabel="name" />
                </sf:select>
              </div>

              <div class="form-group">
                <label for="">Title</label><br>
                <sf:input type="text" id="title" name="title" path="title" Placeholder=" Title"></sf:input>
              </div>

              <div class="form-group">
                <label for="">Price</label><br>
                <sf:input type="text" id="price" name="price" path="price" Placeholder=" Price"></sf:input>
              </div>

              <div class="form-group">
                <label for="">Price Sale</label><br>
                <sf:input type="text" id="priceSale" name="priceSale" path="priceSale" Placeholder=" Price Sale"></sf:input>
              </div>

              <div class="form-group">
                <label for="">Description</label><br>
                <sf:textarea autocomplete="off" rows="4" id="shortDes" name="shortDes" path="shortDes" Placeholder=" Short Description"></sf:textarea>
              </div>

              <div class="form-group" style="width: 88%;">
                    <sf:textarea  id="summernote" name="editordata" path="details"></sf:textarea>
              </div>
              <div class="form-check">
                <sf:checkbox class="form-check-input" id="isHot" path="isHot" />
                <label for="isHot" class="isHot" >Is Hot Product ?</label><br>
              </div>

              <div class="form-group" style="width: 55%;">
                <label for="">Avatar</label><br>
                <input type="file" class="form-control-file" id="fileProductAvatar" name="productAvatar">
              </div>

              <div class="form-group" style="width: 55%;">
                <label for="">Picture</label><br>
                <input type="file" class="form-control-file" id="fileProductPictures" name="productPictures" path="path" multiple="multiple">
              </div>

            </div>
         <div class="form-group">
            <a href="#list-product" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
           <a href="/admin/product/addOrUpdate" class="btn btn-danger">Add New Product</a>
           <button type="submit" class="btn btn-primary">Save Product</button>
         </div>
         </sf:form>
      </div>
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
                        <td><data class="productId" value="${product.id}">${product.id}</data></td>
                        <td>${product.title}</td>
                        <td>
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price }" type="currency" />
                        </td>
                        <td>${product.categories.name}</td>
                        <td>
                            <span id="_product_status_${product.id} }">
                                <c:choose>
                                    <c:when test="${product.status }">
                                        <input type="checkbox" checked="checked" readonly="readonly">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" readonly="readonly">
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </td>
                        <td><img src="${base}/upload/${product.avatar}" width="60" height="90" alt=""></td>
                        <td>
                          <a class="btn btn-primary" href="/admin/product/edit/${product.id}"><i class="far fa-edit"></i></a>
                          <a href="/admin/product/delete/${product.id}" class="btn btn-danger delete-product" ><i class="fas fa-trash-alt"></i></a>
                          <a href="/admin/product/showMore/${product.id}" class="btn btn-info " ><i class="fas fa-info-circle"></i></a>
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
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>
