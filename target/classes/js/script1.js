
// Ẩn hiệu row-menu
$(document).ready(function(){
    $(".main-menu li").hover(function(){
        $(this).find(".row-menu").css('display', 'flex');
    }, function(){
        $(this).find(".row-menu").css('display', 'none');
    });
});

// Ẩn hiệu menu khi responsive
$('#btn-show-hide').on('click', function(){
	$('.main-menu > ul').css('margin-left', 0);
});
$('.btn-hide-sidebar').on('click', function(){
	$('.main-menu > ul').css('margin-left', '-400px');
});
// Ẩn hiệu search khi responsive
$('#btn-show-hide').on('click', function(){
	$(' .form_search  form').css('margin-left', 0);
});
$('.btn-hide-sidebar').on('click', function(){
	$(' .form_search  form').css('margin-left', '-400px');
});


$(document).ready(function(){
    $(window).scroll(function(event){
        var height = $('html,body').scrollTop();
        if (height > 20) {
            $('.header .head-bot').addClass('sticky');
        } else {
            $('.header .head-bot').removeClass("sticky");
        }
    });
});
// back to top
$(document).ready(function(){
    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('#on_top').fadeIn();
        } else {
            $('#on_top').fadeOut();
        }
    });
    $('#on_top').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});
// hiệu ứng thêm hàng vào giỏ
    $(document).on('click','.by-now', function(e){
    e.preventDefault();
    if ($(this).hasClass('disable')){
        return false;
    }
    $(document).find('.by-now').addClass('disable');
    var parent = $(this).parents('.card');
    var src = parent.find('img').attr('src');
    var cart = $(document).find('#cart-shop');
    var parTop = parent.offset().top;
    var parLeft = parent.offset().left;
    $('<img />', {
        class: 'img-product-fly',
        src: src,
    }).appendTo('body').css({
        'top': parseInt(parTop) + parseInt(parent.height())-90,
        'left': parLeft,
    });

    setTimeout(function(){
        $(document).find('.img-product-fly').css({
            'top'   : cart.offset().top,
            'left'  : cart.offset().left,
        });
        setTimeout(function(){
            $(document).find('.img-product-fly').remove();

            $(document).find('.by-now').removeClass('disable');
        },1000)
    },400);

});


// dành cho trang 2
$(document).on('click','#add-to-cart', function(e){
    e.preventDefault();
    if ($(this).hasClass('disable')){
        return false;
    }
    $(this).addClass('disable');
    var src = $(document).find('.product-image img').attr('src');
    var quantity = $(document).find('.quantity input').val();
    console.log(quantity);
    var cart = $(document).find('#cart-shop');
    var parTop = $(this).offset().top;
    var parLeft = $(this).offset().left;
    $('<img />', {
        class: 'img-product-fly',
        src: src,
    }).appendTo('body').css({
        'top': parTop,
        'left': parLeft,
    });

    setTimeout(function(){
        $(document).find('.img-product-fly').css({
            'top'   : cart.offset().top,
            'left'  : cart.offset().left,
        });
        setTimeout(function(){
            $(document).find('.img-product-fly').remove();

            $(document).find('#add-to-cart').removeClass('disable');
        },1000)
    },300);

});

$(document).on('click','.product-color ul li', function(e){
    e.preventDefault();
    var srcimage = $(this).find('img').attr('src');
    $(this).parents().find('.product-image img').attr('src',srcimage);
})



$(document).ready(function () {
    var itemsMainDiv = ('.MultiCarousel');
    var itemsDiv = ('.MultiCarousel-inner');
    var itemWidth = "";

    $('.leftLst, .rightLst').click(function () {
        var condition = $(this).hasClass("leftLst");
        if (condition)
            click(0, this);
        else
            click(1, this)
    });

    ResCarouselSize();




    $(window).resize(function () {
        ResCarouselSize();
    });

    //this function define the size of the items
    function ResCarouselSize() {
        var incno = 0;
        var dataItems = ("data-items");
        var itemClass = ('.item');
        var id = 0;
        var btnParentSb = '';
        var itemsSplit = '';
        var sampwidth = $(itemsMainDiv).width();
        var bodyWidth = $('body').width();
        $(itemsDiv).each(function () {
            id = id + 1;
            var itemNumbers = $(this).find(itemClass).length;
            btnParentSb = $(this).parent().attr(dataItems);
            itemsSplit = btnParentSb.split(',');
            $(this).parent().attr("id", "MultiCarousel" + id);


            if (bodyWidth >= 1200) {
                incno = itemsSplit[2];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 992) {
                incno = itemsSplit[2];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 732) {
                incno = itemsSplit[1];
                itemWidth = sampwidth / incno;
            }
            else {
                incno = itemsSplit[0];
                itemWidth = sampwidth / incno;
            }
            $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
            $(this).find(itemClass).each(function () {
                $(this).outerWidth(itemWidth);
            });

            $(".leftLst").addClass("over");
            $(".rightLst").removeClass("over");

        });
    }


    //this function used to move the items
    function ResCarousel(e, el, s) {
        var leftBtn = ('.leftLst');
        var rightBtn = ('.rightLst');
        var translateXval = '';
        var divStyle = $(el + ' ' + itemsDiv).css('transform');
        var values = divStyle.match(/-?[\d\.]+/g);
        var xds = Math.abs(values[4]);
        if (e == 0) {
            translateXval = parseInt(xds) - parseInt(itemWidth * s);
            $(el + ' ' + rightBtn).removeClass("over");

            if (translateXval <= itemWidth / 1) {
                translateXval = 0;
                $(el + ' ' + leftBtn).addClass("over");
            }
        }
        else if (e == 1) {
            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
            translateXval = parseInt(xds) + parseInt(itemWidth * s);
            $(el + ' ' + leftBtn).removeClass("over");

            if (translateXval >= itemsCondition - itemWidth / 2) {
                translateXval = itemsCondition;
                $(el + ' ' + rightBtn).addClass("over");
            }
        }
        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
    }

    //It is used to get some elements from btn
    function click(ell, ee) {
        var Parent = "#" + $(ee).parent().attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);
    }

});

// contact

function SaveContact(baseUrl) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		email: jQuery("#email").val(), // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/index", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			alert("Chúc mừng bạn đã đăng ký thaanhf công với địa chỉ email: " + jsonResult.message.email);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}




 // tăng số giảm số lượng
$(".button-up").on("click", function(e){
        var soluong = $(this).parent().find('.input-value').val();
        soluong = parseInt(soluong) + 1;
        if(soluong >=  1 ){
            $(this).parent().find('.input-value').html('.input-value').val(soluong);
        }
    })

$(".button-down").on("click", function(e){
        var soluong = $(this).parent().find('.input-value').val();
        soluong = parseInt(soluong) - 1;
        if(soluong >=  1 ){
            $(this).parent().find('.input-value').html('.input-value').val(soluong);
        }
    })

// thêm sản phẩm vào giở hàng
function AddToCart(baseUrl, productId, quantity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
		quantity: quantity, // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
		    $(".button-down").on("click", function(e){
               var sl = parseInt($(this).parent().find('.input-value').val())+0;
               console.log(sl);
               if(sl <= 1){
                    alert("Số lượng không hợp lệ.");
               }
            })
            // tăng số lượng sản phẩm trong giỏ hàng trong icon
            $( "#iconShowTotalItemsInCart" ).html(jsonResult.totalItems);
            $("#total-money").html(jsonResult.totalPrice);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

// delete

$(".delete-product").on("click", function(e){
    var id = $(this).parents().find('.productId').val();
    console.log($(this).parents().find('.productId').val());
    confirm('Bạn chắc chắn muốn xóa sản phẩm có id '+ id);
})
// xóa sản phẩm
function buyNow(baseUrl){
          //javascript object
          // data la du lieu ma day len action cua controller
          let data = {
            customerFullName: jQuery("#customerFullName").val(),       // lay theo id
            customerEmail: jQuery("#customerEmail").val(),
            customerPhone: jQuery("#customerPhone").val(),
            customerAddress: jQuery("#customerAddress").val(),
          };
          // $ === jQuery
          // json === javascript object
          jQuery.ajax({
            url: baseUrl + "/ajax/cart/view", //action
            type: "post",
            contentType: "application/json",
            data:JSON.stringify(data),
            dataType:"json", // kiểu dữ liệu trả về từ controller là json
            success: function(jsonResult){
                if(data.customerFullName == "" || data.customerEmail == "" || data.customerPhone == "" || data.customerAddress == "" )
                {
                    alert("Vui lòng nhập thông tin.");
                }
                else {
                    alert("Chúc mừng bạn đã đặt hàng thành công! Mời bạn xem thêm sản phẩm.");
                }
            },
            error: function error(jqXhr, textStatus, errorMessage){ //error callback
                alert("Không thành công vui lòng quay lại. ");
            }
          })
      }


//function buyNow(baseUrl){
//      //javascript object
//      // data la du lieu ma day len action cua controller
//      let data = {
//        customerFullName: jQuery("#customerFullName").val(),       // lay theo id
//        customerEmail: jQuery("#customerEmail").val(),
//        customerPhone: jQuery("#customerPhone").val(),
//        customerAddress: jQuery("#customerAddress").val(),
//      };
//      // $ === jQuery
//      // json === javascript object
//      jQuery.ajax({
//        url: baseUrl + "/ajax/cart/view", //action
//        type: "post",
//        contentType: "application/json",
//        data:JSON.stringify(data),
//        dataType:"json", // kiểu dữ liệu trả về từ controller là json
//        success: function(jsonResult){
//            var cusName = $(document).getElementById('customerFullName').val();
//            var cusEmail = $(document).getElementById('customerEmail').val();
//            var cusPhone = $(document).getElementById('customerPhone').val();
//            var cusAddress = $(document).getElementById('customerAddress').val();
//            if(cusName == "" || cusEmail=="" || cusAddress="" || cusPhone==""){
//                alert("Vui lòng điền thông tin");
//            }
//            else{
//                alert("Chúc mừng bạn đã đặt hàng thành công! Mời bạn xem thêm sản phẩm.");
//            }
//            },
//        error: function error(jqXhr, textStatus, errorMessage){ //error callback
//            alert("Không thành công vui lòng quay lại. ");
//        }
//      })
//    }