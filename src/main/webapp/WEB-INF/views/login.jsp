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
  <title>Sign In</title>
  <!-- Common -->
   <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/images/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style0.min.css">
</head>

<body>
  <div class="layer"></div>
<main class="page-center">
  <!-- Spring form -->
  <article class="sign-up">
      <h1 class="sign-up__title">Chào mừng bạn!</h1>
      <p class="sign-up__subtitle">Vui lòng đăng nhập để trải nghiệm tốt hơn</p>

        <form class="sign-up-spring-form form" style="padding: 10px 40px 40px 40px" action="/perform_login" method="POST">
              <input type="hidden" name="${_csrf.parameterName}"
                    value="${_csrf.token}" />

                <!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
                <c:if test="${not empty param.login_error}">
                    <div class="alert alert-danger" style="line-height: 20px; flex-wrap: wrap; text-align: center" role="alert">
                    Đăng nhập thất bại <br> Vui lòng thử lại!
                    </div>
                </c:if>
              <label class="form-label-wrapper">
                <p class="form-label">Tài khoản</p>
                <input class="form-input" id="username" type="username" name="username"  placeholder="Enter your username" ></input>
              </label>
              <label class="form-label-wrapper">
                <p class="form-label">Mật khẩu</p>
                <input class="form-input" id="password" type="password" name="password"  placeholder="Enter your password" ></input>
              </label>
              <a class="link-info forget-link" href="##">Quên mật khẩu?</a>

              <label class="form-checkbox-wrapper">
                <input class="form-checkbox" type="checkbox" name="remember-me"></input>
                <span class="form-checkbox-label">Ghi nhớ đăng nhập</span>
              </label>
              <button class="form-btn primary-default-btn transparent-btn" >Đăng nhập</button>
              <a class="link-info forget-link mt-4" href="${base}/signUp">Bạn chưa có tài khoản?</a>
            </form>
    </article>
</main>
<!-- Chart library -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/chart.min.js"></script>
<!-- Icons library -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/feather.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/script.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>

</body>
</html>