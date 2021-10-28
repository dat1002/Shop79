<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
        <div class="header">
            <div class="head-top bg-light" >
                <div class="container d-flex justify-content-between pt-1">
                    <div class="left ">
                        <span class="icon_top_number"><i class="fas fa-phone-square-alt"></i></span>
                        <span class="phone_number">0972395389</span>
                    </div>
                    <div class="right">
                      <ul class="d-flex" style="list-style-type: none;">
                           <li>
                              <c:choose>
                                    <c:when test = "${isLogined}">
                                      <div class="dropdown">
                                        <button class="dropdown-toggle" style="padding: 0; border: none;" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                          <span class="icon_top_account"><i class="fas fa-user-circle"></i></span>
                                             <span class="account ">${userLogined.nameUser}</span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                             <a class="dropdown-item" role="button" href="${base}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                                        </ul>
                                      </div>
                                    </c:when>

                                  <c:when test = "${isNotLogined}">
                                      <div class="dropdown">
                                        <button class="dropdown-toggle" style="padding: 0; border: none;" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                          <span class="icon_top_account"><i class="fas fa-user-circle"></i></span>
                                             <span class="account ">Tài khoản</span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                             <a class="dropdown-item" role="button" href="${base}/login"><i class="fas fa-sign-out-alt"></i> Đăng nhập</a>
                                        </ul>
                                      </div>
                                    </c:when>
                                </c:choose>

                          </li>

                        <!--  <li>
                              <a href="${base}/login" class="text-dark" style="text-decoration: none;">
                                  <span class="icon_top_account"><i class="fas fa-user-circle"></i></span>
                                  <span class="account ">Tài khoản</span>
                                  <span>
                                    <c:if test="{isLogined}">
                                        (${userLogined.email})
                                    </c:if>
                                    <c:if test="{isNotLogined}">
                                        (Đạt)
                                    </c:if>
                                  </span>
                              </a>
                          </li>
                          -->
                          <li>
                              <a id="cart-shop" href="${base}/cart/view" class="text-dark ps-4" style="text-decoration: none;">
                                  <span class="icon_top_cart"><i class="fas fa-shopping-cart"></i></span>
                                  <span class="cart " id="count-item">Giỏ hàng(<span id="iconShowTotalItemsInCart" class='text-danger' >0${totalItems}</span>)</span>
                              </a>
                          </li>
                      </ul>
                    </div>
                </div>
            </div>
            <div class="head-bot d-block bg-white" style="width: 100%;">
                <div class="container d-flex justify-content-between bg-white">
                    <div class="shop-name text-center pt-2" style="letter-spacing: 4px;">
                        <a href="../home/layout1.html" class="text-dark text-decoration-none">
                          <h4 class="fw-bold fs-3">SHOP79</h4>
                          <h6 class="fw-bolder" style="font-size: 12px;"><i class="fas fa-caret-right"></i> ORIGINAL MENWEARS <i class="fas fa-caret-left"></i> </h6>
                        </a>
                    </div>
                    <div class="main-menu d-lg-block">
                        <ul class="nav" id="apper">
                            <li class="nav-item ">
                                <a class="nav-link "  href="#">SALE</a>
                                <div class="row-menu" id="nav-item-1">
                                    <div class="row-menu-content">
                                        <div class="row-menu-img ">
                                            <a  href="#">
                                                <img src="../images/sp11.jpg" width="80px">
                                                <h6 >Áo Thun Tanktop</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210516/RAT5002__12_.jpg" width="80px">
                                                <h6 >Áo Tanktop Regular 5002</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210604/PL4004__25_.jpg" width="80px">
                                                <h6 >Áo Polo Lacoste Slimfit 4004</h6>
                                            </a>
                                            <a  href="#">
                                                                                            <img src="../images/sp11.jpg" width="80px">
                                                                                            <h6 >Áo Thun Tanktop</h6>
                                                                                        </a>
                                                                                        <a href="#">
                                                                                            <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210516/RAT5002__12_.jpg" width="80px">
                                                                                            <h6 >Áo Tanktop Regular 5002</h6>
                                                                                        </a>
                                                                                        <a href="#">
                                                                                            <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210604/PL4004__25_.jpg" width="80px">
                                                                                            <h6 >Áo Polo Lacoste Slimfit 4004</h6>
                                                                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <button type="button" class="btn-hide-sidebar d-block d-lg-none position-absolute fs-4" style="top: 0; left: 332px;">
                              <i class="fas fa-times"></i>
                            </button>
                            <li class="nav-item ">
                                <a class="nav-link " href="#">ÁO NỮ</a>
                                <div class="row-menu " id="nav-item-2">
                                    <div class="row-menu-content ">
                                        <ul>
                                            <li>
                                                <a href="#">ÁO SƠ MI</a>
                                            </li>
                                            <li>
                                                <a href="#">VÁY </a>
                                            </li>
                                            <li>
                                              <a href="#">ÁO SƠ MI</a>
                                            </li>
                                            <li>
                                              <a href="#">ÁO THUN</a>
                                            </li>
                                        </ul>
                                        <div class="row-menu-img ">
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2915202131534_1_thumb.jpg" width="80px">
                                                <h6 >Áo phông nữ H5061</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/7136/ps/20210329/2913202131345_1_thumb.jpg" width="80px">
                                                <h6 >Áo phông nữ H5061</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210516/RAT5002__12_.jpg" width="80px">
                                                <h6 >Áo phông nữ H5061</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#">PHỤ KIỆN</a>
                                <div class="row-menu " id="nav-item-3">
                                    <div class="row-menu-content ">
                                        <ul>
                                            <li>
                                                <a href="#">GIÀY NAM</a>
                                            </li>
                                            <li>
                                                <a href="#">BALO</a>
                                            </li>
                                            <li>
                                              <a href="#">TÚI ĐEO CHÉO</a>
                                          </li>
                                        </ul>
                                        <div class="row-menu-img ">
                                          <a href="#">
                                            <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20201028/gn2090__2_.jpg" width="80px">
                                            <h6 >Giày nam 2090</h6>
                                          </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20201206/bll0927_2_.jpg" width="80px">
                                                <h6 >Balo Da 9095</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20201028/tui6069__1_.jpg" width="80px">
                                                <h6 >Túi Đeo Chéo MK 6069</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#">ÁO NAM</a>
                                <div class="row-menu " id="nav-item-4">
                                    <div class="row-menu-content ">
                                        <ul>
                                            <li>
                                              <a href="#">ÁO SƠ MI</a>
                                            </li>
                                            <li>
                                              <a href="#">ÁO PHÔNG NAM</a>
                                            </li>
                                            <li>
                                              <a href="#">ÁO TANKTOP</a>
                                            </li>
                                            <li>
                                              <a href="#">ÁO POLO</a>
                                            </li>
                                        </ul>
                                        <div class="row-menu-img ">
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210604/SM2039__3_.jpg" width="80px">
                                                <h6 >Sơ Mi Kẻ Regular 2039</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210517/4002__9_.jpg" width="80px">
                                                <h6 >Áo Polo Krik Rayon Slimfit 4001</h6>
                                            </a>
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210604/PL4004__25_.jpg" width="80px">
                                                <h6 >Áo Polo Lacoste Slimfit 4004</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#">QUẦN NAM</a>
                                <div class="row-menu " id="nav-item-5">
                                    <div class="row-menu-content ">
                                        <ul>
                                            <li>
                                              <a href="#">QUẦN JEANS</a>
                                            </li>
                                            <li>
                                              <a href="#">QUẦN SHORT</a>
                                            </li>
                                            <li>
                                              <a href="#">QUẦN JOGGER</a>
                                            </li>
                                            <li>
                                              <a href="#">QUẦN ÂU</a>
                                            </li>
                                        </ul>
                                        <div class="row-menu-img ">
                                            <a href="#">
                                                <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20201203/qjt100__1_.jpg" width="80px">
                                                <h6 >Quần Jogger 1700 </h6>
                                            </a>
                                            <a href="#">
                                                <img src="	https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210607/QS1509__2_.jpg" width="80px">
                                                <h6 >Quần Short Slimfit 1506</h6>
                                            </a>
                                            <a href="#">
                                                <img src="	https://storage.googleapis.com/cdn.nhanh.vn/store/662/ps/20210326/qa0317__2_.jpg" width="80px">
                                                <h6 >Quần Âu Slimfit 1531</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                              </li>
                          </ul>
                    </div>
                    <div class="form_search position-relative pt-2">
                          <form method="GET" action="#">
                            <input type="text" name="keyword" placeholder="Tìm kiếm ...">
                            <button type="submit" class="position-absolute">
                                <i class="fal fa-search"></i>
                            </button>
                          </form>
                        <div class="show_hide_sidebar d-flex d-lg-none pt-3">
                          <button type="button" id="btn-show-hide" class="btn btn-white fs-4">
                            <i class="fas fa-bars"></i>
                          </button>
                        </div>
                    </div>
                </div>
                <div class="shadow p-1 mb-1 bg-body rounded">
                </div>
            </div>
        </div>
    </header>