<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm mới</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${base}/css/style3.css">
    <link rel="stylesheet" href="${base}/css/style.css">
    <link rel="icon" href="../images/b.png" type="image/gif" sizes="16x16">

</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
        <div class="body">
            <div class="container pt-3">
                <nav class="navbar navbar-expand-lg">
                  <div class="container-fluid ps-0">
                    <a class="navbar-brand" href="#" style="font-size: 17px; color: black;">Trang chủ</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black;">
                            Danh mục sản phẩm
                          </a>
                          <ul class="dropdown-menu " aria-labelledby="navbarDarkDropdownMenuLink">
                            <c:forEach items="${categories }" var="category">
                               <li><a class="dropdown-item" href="${base}/category/${category.seo}"/>${category.name}</a></li>
                           </c:forEach>
                          </ul>
                        </li>
                      </ul>
                    </div>
                  </div>
                </nav>
            </div>
            <div class="container pt-5 pb-5 d-flex justify-content-between">
              <div class="left-filter d-flex">
                <p>BỘ LỌC</p>
                <div class="filter-by-selection">Thương hiệu <i class="fas fa-sort-down"></i>
                  <div class="row-content bg-white">
                    <div class="forms-check">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          Lacoste
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                        <label class="form-check-label" for="flexCheckChecked">
                          Nike
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          Hermès
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                        <label class="form-check-label" for="flexCheckChecked">
                          Gucci
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="filter-by-selection">Khoảng giá  <i class="fas fa-sort-down"></i>
                  <div class="row-content bg-white">
                    <div class="forms-check">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          Dưới 200,000
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                        <label class="form-check-label" for="flexCheckChecked">
                          Từ 200,000 - 500,000
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          Từ 500,000 - 1000,000
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                        <label class="form-check-label" for="flexCheckChecked">
                          Trên 1,000,000
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="right-sort d-flex">
                <p>Sắp xếp theo: </p>
                <div class="dropdown">
                  <a class="btn btn-white dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                    Mặc định
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <li><a class="dropdown-item" href="#">Giá giảm dần</a></li>
                    <li><a class="dropdown-item" href="#">Giá tăng dần</a></li>
                    <li><a class="dropdown-item" href="#">Sale</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="container " style="max-width: 90%;">
                <div class="products">
                    <c:forEach items="${productsWithSearch.data}" var="product">
                      <div class="product col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                        <div class="card" style="width: 18rem;" >
                            <a href="${base }/details/${product.seo}"><img src="${base}/upload/${product.avatar}" class="card-img-top" alt="..." width="100%"> </a>
                            <div class="card-body">
                              <h6 class="mb-2 card-title">${product.title}</h6>
                              <span class="pe-2" style="font-size: 13px;">
                                <fmt:setLocale value="vi_VN" scope="session" />
                                <fmt:formatNumber value="${product.priceSale }" type="currency" />
                              </span>
                              <span style="text-decoration: line-through; margin-right: 5px; color: rgb(110, 110, 110); font-size: 13px;">
                                <fmt:setLocale value="vi_VN" scope="session" />
                                <fmt:formatNumber value="${product.price }" type="currency" />
                               </span>
                            </div>
                            <div class="card-body-2 ">
                              <a type="button" class="by-now " onclick="javascript:AddToCart('${base }', ${product.id}, 1);">
                                <i class="fas fa-cart-plus"></i>
                                <h6>Mua nhanh</h6>
                              </a>
                              <h4 >|</h4>
                              <a href="../home/layout2.html" class="card-link ">
                                <i class="fas fa-eye"></i>
                                <h6>Xem chi tiết</h6>
                              </a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="link-to-zalo">
              <a href="https://zalo.me/0972395389">
              <img src="../images/logo-zalo-vector.png" width="100%" alt="">
              </a>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/script1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>