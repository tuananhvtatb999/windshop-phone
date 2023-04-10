type = ['primary', 'info', 'success', 'warning', 'danger'];

function showNotification(from, align, message) {
    color = 1;

    $.notify({
        message: message

    }, {
        type: type[color],
        timer: 500,
        placement: {
            from: from,
            align: align
        }
    });
}

function runScript(e, msp) {
    //See notes about 'which' and 'key'
    if (e.keyCode === 13) {
        var tb = document.getElementById(msp);
        eval(tb.value);
        return false;
    }
}

var Cart = {
    redirect: function(){
        window.location.href="/sign-in"
    },
    gioHang: function (maSanPham, soluong) {
        var data = {};
        data["maSanPham"] = maSanPham;
        data["soluong"] = soluong;

        $.ajax({
            url: "/user/add-to-cart",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(data), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    $("#thong_tin_gio_hang").html(jsonResult.data);
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },

    updateGioHang: function (maSanPham, donGia, soluong, total) {
        var data = {};
        data["maSanPham"] = maSanPham;
        data["donGia"] = donGia;
        data["soluong"] = soluong;

        $.ajax({
            url: "/update-gio",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(data), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status === 200) {
                    $('#' + maSanPham).html(soluong * donGia);
                    $('#total').html((Number(jsonResult.data) * donGia + total).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                    $('#order-total').html((Number(jsonResult.data) * donGia + total - 30000).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                    $('#total-item').html((soluong * donGia).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },

    updateQuantity: function (maSanPham, donGia, soluong, total, flag) {
        if (Number($('#' + maSanPham).val()) <= 1 && flag === 'minus') {
                return false;
        }
        var data = {};
        data["maSanPham"] = maSanPham;
        data["donGia"] = donGia;
        data["soluong"] = soluong;

        $.ajax({
            url: "/update-quantity",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(data), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status === 200) {
                    $('#' + maSanPham).val(Number(jsonResult.data));
                    $('#total').html((Number(jsonResult.data) * donGia + total).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                    $('#total-item-' + maSanPham).html((Number(jsonResult.data) * Number(donGia)).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                    $('#order-total').html((Number(jsonResult.data) * donGia + total - 30000).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}

var Product = {
    deleteProduct: function(idP) {
        var id = idP;
        var ok = confirm("Bạn chắc chắn muốn xóa!");
        $.ajax({
            url: "/admin/delete-product",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    if (ok) {
                        $('#status-delete-'+idP).html('<span\n' +
                            'class="badge badge-pill badge-soft-danger font-size-12">Sản phẩm nghỉ bán</span>')
                    }else{
                        return;
                    }
                } else {
                    alert('loi');
                }
            },
            error: function(jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
    deleteOrder: function(idP) {
        var id = idP;
        $.ajax({
            url: "/delete-order",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    location.reload();
                    alert(jsonResult.data);
                } else {
                    alert('loi');
                }
            },
            error: function(jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
    updateStatus: function(idO) {
        var id = idO;
        $.ajax({
            url: "/update-status",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                } else {
                    alert('loi');
                }
            },
            error: function(jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}