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
    <title>${product.title}</title>

    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${base}/css/style2.css">
    <link rel="stylesheet" href="${base}/css/style.css">
    <link rel="icon" href="../images/b.png" type="image/gif" sizes="16x16">
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
        <div class="body">
            <div class="container pt-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <a class="navbar-brand pt-1" href="${base}/index" style="font-size: 18px; color: black;">Trang chủ /</a>
                        <a class="navbar-brand pt-1" href="${base}/category/${product.getCategories().getSeo()}" style="font-size: 17px; color: black;">${product.getCategories().getName()} /</a>
                        <li class="navbar-brand" style="font-size: 16px; color: black; opacity: 0.6;" >${product.title}</li>
                    </ol>
                </nav>
            </div>
            <div class="body-content d-block m-auto" style="max-width: 80%;">
                <div class="container d-flex pt-4" style="width: 100%;">
                    <div class="product-image d-block" style="width: 80%;">
                        <img src="${base}/upload/${product.avatar}" width="100%">
                        <div id="fb-root" class="mb-5"></div>
                            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v12.0" nonce="Xlq0nQ9H"></script>
                          <div class="fb-comments" data-href="http://localhost:8080/home" data-width="" data-numposts="5"></div>
                    </div>
                    <div class="product-infomations d-block ps-4" style="width: 50%">
                        <div class="info">
                            <h6><b id="product-name">${product.title}</b></h6>
                            <h6> Trạng thái: <b>Còn hàng</b> </h6>
                        </div>
                        <hr/>
                        <div class="price mb-2">
                            <span class="pe-2" style="">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.priceSale }" type="currency" />
                          </span>
                          <span style="text-decoration: line-through; margin-right: 5px; color: rgb(110, 110, 110);">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price }" type="currency" />
                          </span>
                        </div>

                        <div class="product-color" style="width: 70%;">
                            <h6><b>MÀU SẮC</b></h6>
                            <ul class="d-flex" style="list-style-type: none;">
                                <li class="color-image"><img src="${base}/upload/${product.avatar}"  width="100%"></li>

                                <c:forEach items="${productImages.data}" var="prI" >
                                    <c:if test="${prI.getProduct().getId() == product.id}">
                                            <li class="color-image"><img src="${base}/upload/${prI.path}" width="100%"></li>
                                    </c:if>
                                </c:forEach>
                                <!--
                                <li class="color-image"><img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2918202131831_IMG_4402.jpg"  width="100%"></li>
                                <li class="color-image"><img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2917202131755_1.jpg"  width="100%"></li>
                                <li class="color-image"><img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2918202131818_IMG_4405.jpg"  width="100%"></li>
                                -->
                            </ul>
                        </div>
                        <div class="product-size">
                            <h6><b>KÍCH THƯỚC</b> <a>Hướng dẫn chọn Size</a></h6>
                            <ul class="d-flex" style="list-style-type: none;">
                                <c:forEach items="${productDetails.data}" var="pd">
                                    <c:if test="${pd.getProduct().getId() == product.id}">
                                        <li>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">${pd.size}</label>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                               <!-- <li>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">M</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">L</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">XL</label>
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                        <div class="quantity fs-5 mt-4">
                            <h6><b>SỐ LƯỢNG</b></h6>
                            <input class="text-center" style="margin-left: 5%;" id="quantity" type="number" value="1" max="100" min="1">
                        </div>
                        <div class="selected d-flex pt-2"> 
                            <button type="button" id="add-to-cart" class="btn btn-dark btn-sm m-3" style="width: 40%;" onclick="javascript:AddToCart('${base }', ${product.id}, parseInt($(document).find('#quantity').val()));">THÊM HÀNG VÀO GIỎ</button>
                            <button type="button" id="buy-now" class="btn btn-dark btn-sm m-3" style="width: 40%;">MUA NGAY</button>
                        </div>
                        <div class="like d-flex justify-content-center pt-2 m-auto" >
                            <i class="far fa-heart fs-2"></i>
                            <h6 class="ps-2 pt-2">YÊU THÍCH</h6>
                        </div>
                        <div class="share d-flex justify-content-center pt-3">
                            <h6 class="pt-2"><b>CHIA SẺ</b></h6>
                            <div class="icon ps-3 fs-4">
                                <a href="https://www.facebook.com/profile.php?id=100004302647746"><i class="fab fa-facebook-f  ms-2"></i></a>
                            </div>
                            <div class="icon ps-4 fs-4">
                                <a href="#"><i class="fab fa-twitter "></i></a>
                            </div>
                            <div class="icon ps-4 fs-4 ">
                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                            </div>
                        </div>
                        <div class="store-policy pt-4" style="width:90%">
                            <h6><b>CHÍNH SÁCH CỦA SHOP</b></h6>
                            <ul class="bg-light mt-2" style="list-style-type: none; line-height:30px">
                                <li class="pt-3"> ►Đổi hàng trong vòng 3 ngày.</li>
                                <li> ►Giảm 10% trên tổng hóa đơn khi mua hàng ( tại cửa hàng ) vào tuần sinh nhật ( trước và sau ngày sinh nhật 3 ngày ).</li>
                                <li> ►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.</li>
                                <li class="pb-4"> ►Tích điểm 3-10% giá trị đơn hàng cho mỗi lần mua và trừ tiền vào lần mua tiếp theo.</li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container pt-5 pb-6 mb-6">
                <div class="product-same-category">
                    <h4>SẢN PHẦM CÙNG DANH MỤC</h4>
                    <div class="list-product">
                        <div class="MultiCarousel" style="margin-bottom: 60px;" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
                            <div class="MultiCarousel-inner d-flex">
                                <c:forEach items="${productList.data}" var="pr">
                                    <c:if test="${pr.getCategories().getId() == product.getCategories().getId()}">
                                        <div class="item ">
                                          <div class="product">
                                            <div class="card" style="width: 18rem;" >
                                                <a href="${base }/details/${pr.seo}"><img src="${base}/upload/${pr.avatar}" class="card-img-top" alt="..." width="100%"> </a>
                                                <div class="card-body">
                                                  <h6 class="mb-1 card-title">${pr.title}</h6>
                                                  <span class="pe-2 price-sale" style="font-size: 15px;">
                                                    <fmt:setLocale value="vi_VN" scope="session" />
                                                    <fmt:formatNumber value="${pr.priceSale }" type="currency" />
                                                  </span>
                                                  <span class="price" style="text-decoration: line-through; margin-right: 5px; color: rgb(110, 110, 110); font-size: 14px;">
                                                    <fmt:setLocale value="vi_VN" scope="session" />
                                                    <fmt:formatNumber value="${pr.price }" type="currency" />
                                                   </span>
                                                </div>
                                                <div class="card-body-2 ">
                                                  <a type="button" class="by-now " onclick="javascript:AddToCart('${base }', ${pr.id}, 1);">
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
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <button type="button" class="btn btn-primary leftLst"><i class="fas fa-chevron-left"></i></button>
                            <button type="button" class="btn btn-primary rightLst"><i class="fas fa-chevron-right"></i></button>
                        </div>
                  </div>
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