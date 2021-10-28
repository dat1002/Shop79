var count
var index
$(".form-add-product").on("click",".button-add-product", function(){
    add();
});

function add(){
    count = $('#table-product tr').length;
    const product = `<tr>
    <td>`+count+`</td>
    <td items="${products}" itemValue="title" itemLabel="title"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>
      <a class="" href="${base}/admin/product/edit/${product.id}"><button type="button" class="edit" id="">Edit</button></a>
      button type="button" class="delete" id="">Delete</button>
    </td>
  </tr>`;
    $("#table-product").append(product);
}


$("#table-product").on("click",'.delete',function(){
    var check = confirm("Bạn muốn xóa sản phẩm này?");
    if(check == true){
        count = parseInt($('#table-product tr').length-1);
        var currentRow=$(this).closest("tr");
		var index = parseInt(currentRow.find("td:eq(0)").html());
        for(var i = index + 1; i < count; i++ ){
            $(this).find("tr .stt").html(1);
            $("#table-product td:contains('" + i + "')").html(i-1);
        }
        $(this).parent().parent().remove();
    }
    else{
        return;
    }
    
});

$(".delete-product").on("click", function(e){
    var id = $(this).parents().find('.productId').val();
    console.log($(this).parents().find('.productId').val());
    confirm('Are you sure you want to delete this product? ');
})

// console.log($(document).getElementsById(maSP));

// xóa sản phẩm
//function deletepr(baseUrl){
//          //javascript object
//          // data la du lieu ma day len action cua controller
//          let data = {
//            productId: jQuery("#productId").val(),       // lay theo id
//          };
//          // $ === jQuery
//          // json === javascript object
//          jQuery.ajax({
//            url: baseUrl + "/ajax/admin/product/delete/{productId}", //action
//            type: "get",
//            contentType: "application/json",
//            data:JSON.stringify(data),
//            dataType:"json", // kiểu dữ liệu trả về từ controller là json
//
//            success: function(jsonResult){
//            confirm('Bạn chắc chắn muốn xóa sản phẩm có id: '+productId+'?')
//            alert("Đã xóa thành công!");
//
//            error: function(jqXhr, textStatus, errorMessage){ //error callback
//                    alert("Không thành công. ");
//            }
//          })
//      }

function SaveContact(baseUrl){
          //javascript object
          // data la du lieu ma day len action cua controller
          let data = {
            email: jQuery("#email").val(),       // lay theo id
          };
          // $ === jQuery
          // json === javascript object
          jQuery.ajax({
            url: baseUrl + "/ajax/sigin", //action
            type: "post",
            contentType: "application/json",
            data:JSON.stringify(data),
            dataType:"json", // kiểu dữ liệu trả về từ controller là json
            success: function(jsonResult){
            if(jsonResult.message.email == "") alert("Vui lòng nhập địa chỉ email");
            else{
                alert("Chúc mừng bạn! Đã đăng ký thành công với địa chỉ email: " + jsonResult.message.email);
                $(document).ready(function(){
                    $('#thongBao05').html('Chúc mừng bạn đã đăng ký thành công');
                })
                setTimeout(function (){
                   $('#thongBao05').html('');
                },1500)
            }

            },
            error: function(jqXhr, textStatus, errorMessage){ //error callback
                    alert("Không thành công. " + jsonResult.message.email);
            }
          })
      }
