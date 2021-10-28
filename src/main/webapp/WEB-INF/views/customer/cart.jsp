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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop 79</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="${base}/css/cart.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <!-- css -->
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <link rel="icon" href="${base}/images/b.png" type="image/gif" sizes="16x16">
</head>
<body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v12.0" nonce="Xlq0nQ9H"></script>
  <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
     <main>
          <div class="container mb-5 mt-5 pe-5" style="display: flex; width: 85%; " >
            <form action="${base}/cart/checkout" style="width: 100%;" method="post" modelAttribute="products">
                <div class="" style="display: flex; width: 100%;">
                    <div class="boxLeftCart" style="width:65%" >
                        <table class="table-product" style="width: 80%;">
                          <thead>
                            <tr class="bg-dark" style="width: 100%; color: #fff;">
                              <td width="20%">Ảnh sản phẩm</td>
                              <td width="30%">Tên sản phẩm</td>
                              <td width="20%">Số lượng</td>
                              <td width="15%">Giá</td>
                              <td width="15%">Lựa chọn</td>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${cart.cartItems}" var="ci">
                                <tr style="width: 100%;">
                                  <td style="width: 20%"><img src="${base}/upload/${ci.avatar}" width="80px" alt=""></td>
                                  <td style="width: 30%; text-align: left; padding-right: 5px;" >${ci.productName}</td>
                                  <td style="width: 20%" >
                                    <div class="d-flex">
                                        <button type="button" class="btn button-down" onclick="javascript:AddToCart('${base }', ${ci.productId}, -1);">-</button>
                                        <input type="text" class="input-value"  min="1" max="100" style="width: 30px; text-align: center;" value="${ci.quantity}">
                                        <button type="button" class="btn button-up" onclick="javascript:AddToCart('${base }', ${ci.productId}, 1);">+</button>
                                    </div>
                                  </td>
                                  <td style="width: 15%">
                                  <fmt:setLocale value="vi_VN" scope="session" />
                                  <fmt:formatNumber value="${ci.priceUnit}" type="currency" />
                                  </td>
                                  <td style="width: 15%">
                                    <a type="button" href="${base}/cart/delete/${ci.productId}" class="btn btn-danger" >Xóa</a>
                                  <td>
                                </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                      <div class="customerInf pt-5" style="width: 80%">
                            <div class="pt-2 pb-3">
                              <span>THÔNG TIN KHÁCH HÀNG</span>
                              <br>
                            </div>
                            <c:choose>
                                <c:when test="${isNotLogined}">
                                    <div class="form-group">
                                        <label for="customerEmail">Họ và tên </label>
                                        <input type="text" class="form-control" id="customerFullName" name="customerFullName" placeholder="Your name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerEmail">Email </label>
                                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerPhone">Số Điện Thoại</label>
                                        <input type="tel" class="form-control" id="customerPhone" name="customerPhone" placeholder="Phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerAddress">Địa chỉ nhận hàng</label>
                                        <input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Address" required>
                                    </div>
                                </c:when>
                                <c:when test="${isLogined}">
                                    <div class="form-group">
                                        <label for="customerEmail">Họ và tên </label>
                                        <input type="text" class="form-control" id="customerFullName" name="customerFullName" placeholder="Your name" value="${userLogined.nameUser}">
                                    </div>
                                    <div class="form-group">
                                        <label for="customerEmail">Email </label>
                                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email" value="${userLogined.email}">
                                    </div>
                                    <div class="form-group">
                                        <label for="customerPhone">Số Điện Thoại</label>
                                        <input type="tel" class="form-control" id="customerPhone" name="customerPhone" placeholder="Phone" value="${userLogined.phone}">
                                    </div>
                                    <div class="form-group">
                                        <label for="customerAddress">Địa chỉ nhận hàng</label>
                                        <input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Address" value="${userLogined.address}">
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>

                    <div class="" style="width: 35%;">
                      <div class="boxRightCart">
                        <div class="InfoCart">
                          <span>TÓM TẮT ĐƠN ĐẶT HÀNG</span> <br>
                          <span>Chưa bao gồm phí vận chuyển</span>
                        </div>
                        <div>
                          <span>Tổng Tiền: </span>
                          <span id="total-money"  style="text-align: right;">
                              <fmt:setLocale  value="vi_VN" scope="session" />
                              <fmt:formatNumber value="${totalPrice}" type="currency" />
                          </span>
                          <input class="customerPrice" style="display: none;" name="customerPrice" path="customerPrice" value="${totalPrice}" enctype="multipart/form-data">

                          </input>
                        </div>
                        <div class="cart-button " style="display: flex; flex-direction: column;">
                          <button  type="submit" onclick="buyNow('${base}');" class="btn btn-dark mb-2 mt-2">Đặt hàng</button>
                          <button type="button" class="btn btn-warning">Mua thêm sản phẩm </button>
                        </div>
                      </div>
                    </div>
                </div>
            </form>
          </div>
      </main>

  <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
    <!-- JS -->
   <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>
