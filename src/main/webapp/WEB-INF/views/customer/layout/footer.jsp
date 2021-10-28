
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
    <div class="footer pt-5">
      <div class="image_store mt-5">
        <img src="https://storage.googleapis.com/cdn.nhanh.vn/store/662/bn/sb_1589529235_237.png" width="100%">
        <hr />
      </div>
      <div class="contact" >
          <div class="contact_with_shop col-12 col-sm-6 col-lg-3">
              <h6>GỌI MUA HÀNG (08:30-22:00)</h6>
              <div class="phone_number">
                  <span class="icon_phone_footer " >
                      <i class="fas fa-phone-alt "></i>
                  </span>
                  <a  href="#">0972395389</a>
              </div>
              <h6>Tất cả các ngày trong tuần</h6>
          </div>
          <div class="contact_with_shop col-12 col-sm-6 col-lg-3">
              <h6>GÓP Ý, KHIẾU NẠI (08:30-22:00)</h6>
              <div class="phone_number">
                  <span class="icon_phone_footer  ">
                      <i class="fas fa-phone-alt "></i>
                  </span>
                  <a  href="#">0972395389</a>
              </div>
              <h6>Các ngày trong tuần(Trừ nghỉ lễ)</h6>
          </div>
          <div class="contact_with_shop col-12 col-sm-6 col-lg-3">
              <h6>ĐĂNG KÝ NHẬN THÔNG TIN MỚI</h6>
              <form class="d-block"  action="${base}/index" method="POST" modelAttribute="contactModel">
                  <div class="input-group">
                      <input type="email" class="form-control" id="email" name="email" path="email" placeholder="Nhập email bạn tại đây..." ></input>
                      <button type="button" class="button-subscribe text-white "  onclick="SaveContact('${base}');">   Đăng ký   </button>
                  </div>
              </form>
          </div>
          <div class="contact_with_shop col-12 col-sm-6 col-lg-3">
              <h6>THEO DÕI CHÚNG TÔI</h6>
              <div class="link_to_account ">
                  <a href="https://www.facebook.com/profile.php?id=100004302647746" >
                      <i class="fab fa-facebook"></i>
                  </a>
                  <a href="https://www.instagram.com/nvd389/" >
                      <i class="fab fa-instagram"></i>
                  </a>
              </div>
          </div>
      </div>
      <a class="on_top" href="#top" style="display: block;"><i class="far fa-arrow-to-top"></i></a>
      <div class="container pt-5" style="background-color: #e4ebeb; max-width: 100%;">
        <div class="store-informations">
          <div class="store-information col-12 col-sm-6 col-lg-3">
            <h6>CHÍNH SÁCH VÀ QUY ĐỊNH</h6>
            <ul class="list-group-flush">
              <a href="#"><li>Cách thức đặt hàng </li></a>
              <a href="#"><li>Chính sách thành viên </li></a>
              <a href="#"><li>Chính sách giao hàng</li></a>
              <a href="#"><li>Quy định đổi trả </li></a>
              <a href="#"><li>Hình thức thanh toán </li></a>
              <a href="#"><li>Chính sách bảo mật </li></a>
              <a href="#"><li>Chính sách xử lý khiêu nại </li></a>
            </ul>
          </div>
          <div class="store-information col-12 col-sm-6 col-lg-3" >
            <h6>HỆ THỐNG CỬA HÀNG</h6>
            <ul class="list-group" style="list-style-type: none;" >
              <li>►79 My Điền, Việt Yên </li>
              <li>►82 Nội Đình, Yên Sơn </li>
              <li>►125 Cầu Giấy </li>
            </ul>
          </div>
          <div class="store-information col-12 col-sm-6 col-lg-3">
            <h6>VỀ CHÚNG TÔI</h6>
            <ul class="list-group-flush">
              <li><b>Công ty TNHH TIME MAN</b></li>
              <li><b>Địa chỉ: </b> Số 344 Cầu Giấy, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội </li>
              <li><b>Mã số doanh nghiệp:</b> 0108901419 do Sở kế hoạch và đầu tư thành phố Hà Nội cấp ngày 17/09/2019</li>
              <li><b>Điện thoại:</b> 0972395389	</li>
              <li><b>Email:</b> nvdat1002@gmail.com	</li>
            </ul>
          </div>
          <div class="store-information col-12 col-sm-6 col-lg-3">
            <h6>PAGE CHÚNG TÔI</h6>
            <ul class="list-group" style="list-style-type: none; flex-wrap: wrap;" >
              <li><a  href="https://www.facebook.com/Shop-free-1757794477583091/?notif_id=1624597893963257&notif_t=page_user_activity&ref=notif">

              </a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>