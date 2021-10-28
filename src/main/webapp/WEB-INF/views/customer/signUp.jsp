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
  <title>Elegant Dashboard | Sign In</title>
  <!-- Common -->
   <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/images/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style0.min.css">
  <style>
        .form-group > input{
            margin-bottom: 17px;
            margin-top: 4px;
            color: #454242;
            padding: 5px 10px;
        }
  </style>
</head>

<body>
  <div class="layer"></div>
<main class="page-center">
  <!-- Spring form -->
  <article class="sign-up">
    <h1 class="sign-up__title">Đăng Ký</h1>
    <p class="sign-up__subtitle">Vui lòng điền thông tin của bạn</p>
    <sf:form class="sign-up-form form" id="user" action="${base}/signUp" name="user" method="post" modelAttribute="user" enctype="multipart/form-data">
        <sf:hidden path="id"/>
        <div class="form-add-update-product">
          <div class="form-group ">
            <label class="form-label">Họ và tên</label><br>
            <sf:input type="text" size="30" id="nameUser" name="nameUser" path="nameUser" Placeholder=" Name" pattern="[A-Z a-z]{8,32}"></sf:input>
          </div>

          <div class="form-group ">
            <label class="form-label">Email</label><br>
            <sf:input type="email" size="30" id="email" name="email" path="email" Placeholder=" Email" pattern="{6,50}"></sf:input>
          </div>

          <div class="form-group ">
            <label class="form-label">Số điện thoại</label><br>
            <sf:input type="text" size="30" id="phone" name="phone" path="phone" Placeholder=" Phone number" pattern="[0-9]{10}"></sf:input>
          </div>

          <div class="form-group ">
            <label class="form-label">Địa chỉ</label><br>
            <sf:input type="text" size="30" id="address" name="address" path="address" Placeholder=" Address" pattern="{1,200}"></sf:input>
          </div>

          <div class="form-group">
            <label class="form-label">Tài khoản</label><br>
            <sf:input type="text" size="30" id="name" name="name" path="username" Placeholder=" Username" pattern="{6,}"></sf:input>
          </div>

          <div class="form-group ">
            <label class="form-label">Mật khẩu</label><br>
            <sf:input type="text" size="30" id="password" name="password" path="password" Placeholder=" Password" pattern="{6,}"></sf:input>
          </div>

        </div>

      <button type="submit" onclick="signUp('${base}');" href="${base}/signUp" class="form-btn primary-default-btn transparent-btn btn-sign-up">Đăng ký</button>
    </sf:form>
    </article>
</main>
<!-- Chart library -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/chart.min.js"></script>
<!-- Icons library -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/feather.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/script.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script>

          $(".btn-sign-up").on("click", function(e){
              alert('Chúc mừng bạn đã đăng ký thành công');
          })

</script>
</body>
</html>