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
                            <c:forEach items="${categoryList.data}" var="category">
                            <li class="nav-item ">
                                <a class="nav-link "  href="${base}/category/${category.seo}">${category.name}</a>
                                <div class="row-menu" id="get${category.id}">
                                    <div class="row-menu-content">
                                        <div class="row-menu-img ">
                                            <c:forEach items="${productList.data}" var="product">
                                                <c:if test="${product.getCategories().getId() == category.id}">
                                                    <a  href="${base }/details/${product.seo}">
                                                        <img src="${base}/upload/${product.avatar}" width="80px">
                                                        <h6 >${product.title}</h6>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                            <button type="button" class="btn-hide-sidebar d-block d-lg-none position-absolute fs-4" style="top: 0; left: 332px;">
                              <i class="fas fa-times"></i>
                            </button>

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