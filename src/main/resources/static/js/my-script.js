type = ['primary', 'info', 'success', 'warning', 'danger'];

function showNotification(from, align, message, cl) {
    $.notify({
        message: message

    }, {
        type: type[cl],
        timer: 100,
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
    redirect: function () {
        window.location.href = "/sign-in"
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

    updateGioHang: function (maSanPham, donGia, e, total) {
        var soluong = e.value;
        if (Number(soluong) < 1) {
            showNotification('top', 'right', 'Please input number more than 0!', 4);
            return;
        }
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

                    $('#item-total-' + maSanPham).val((Number(jsonResult.data) * Number(donGia)))

                    let total1 = 0;
                    $('[id^=item-total-]').each(function(){
                        total1 = Number(total1) + Number(this.value);
                    });

                    $('#total').html(Number(total1)).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });

                    $('#order-total').html(Number(total1) - 30000).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                    $('#total-item').html((soluong * donGia).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }));
                }
                if (jsonResult.status === 400) {
                    showNotification('top', 'right', 'Product has only quantity '+jsonResult.data, 4);
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
                    $('#item-total-' + maSanPham).val((Number(jsonResult.data) * Number(donGia)))

                    let total1 = 0;
                    $('[id^=item-total-]').each(function(){
                        total1 = Number(total1) + Number(this.value);
                    });

                    $('#total').html(parseInt(total1)).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                    $('#total-item-' + maSanPham).html((Number(jsonResult.data) * Number(donGia))).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                    $('#order-total').html(Number(total1) - 30000).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                }
                if (jsonResult.status === 400) {
                    showNotification('top', 'right', 'Product has only quantity '+jsonResult.data, 4);
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}

var Product = {
    deleteProduct: function (idP) {
        var id = idP;
        var ok = confirm("Bạn chắc chắn muốn xóa!");
        $.ajax({
            url: "/admin/delete-product",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    if (ok) {
                        $('#status-delete-' + idP).html('<span\n' +
                            'class="badge badge-pill badge-soft-danger font-size-12">Sản phẩm nghỉ bán</span>')
                    } else {
                        return;
                    }
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
    deleteOrder: function (idP) {
        var id = idP;
        $.ajax({
            url: "/admin/delete-order",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    location.reload();
                    showNotification('top', 'right', 'Delete success!', 2)
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
    updateStatus: function (idO) {
        var id = idO;
        $.ajax({
            url: "/update-status",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}

var User = {
    delete: function (idP) {
        var id = idP;
        var ok = confirm("Bạn chắc chắn muốn xóa!");
        $.ajax({
            url: "/admin/delete-user",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(id), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status === 200) {
                    if (ok) {
                        $('#status-delete-' + idP).html('<span\n' +
                            'class="badge badge-pill badge-soft-danger font-size-12">Người dùng đã bị xóa hoặc không sử dụng</span>')
                    } else {
                        return;
                    }
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}
var Account = {

    changePassword: function () {
        let oldPass = $('#password_old').val();
        let newPass = $('#password_1').val();
        let rePass = $('#password_2').val();

        if (!oldPass || !newPass || !rePass) {
            showNotification('top', 'right', 'Fill fully!', 1)
            return;
        }

        if (newPass !== rePass) {
            showNotification('top', 'right', 'Fill fully!', 1);
            return;
        }

        var data = {};
        data["oldPass"] = oldPass;
        data["newPass"] = newPass;

        $.ajax({
            url: "/user/change-password",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: function (jsonResult) {
                if (jsonResult.status === 200 && jsonResult.data === "Fail") {
                    showNotification('top', 'right', 'Old password incorrect!', 4);
                    return;
                }
                if (jsonResult.status === 200 && jsonResult.data === "Success") {
                    showNotification('top', 'right', 'Change password success', 2);
                    return;
                }
                $('#password_old').val('');
                $('#password_1').val('');
                $('#password_2').val('');
            },
            error: function (jqXhr, textStatus, errorMessage) {
            }
        });
    },

    changeInformation: function () {
        if (!$('#firstName').val() || !$('#lastName').val() || !$('#email').val() || !$('#phoneNumber').val() || !$('#address').val()) {
            showNotification('top', 'right', 'Fill fully!', 1)
            return;
        }
        if (!isEmail($('#email').val())) {
            showNotification('top', 'right', 'Email invalid!', 4);
            return;
        }
        if (!isVietnamesePhoneNumber($('#phoneNumber').val())) {
            showNotification('top', 'right', 'Phone number invalid!', 4);
            return;
        }

        var data = new FormData();
        data.append("firstName", $('#firstName').val());
        data.append("lastName", $('#lastName').val());
        data.append("email", $('#email').val());
        data.append("emailOld", $('#emailOld').val());
        data.append("phoneNumber", $('#phoneNumber').val());
        data.append("address", $('#address').val());
        if ($('#image')[0].files[0]) {
            data.append('image', $('#image')[0].files[0]);
        }

        $.ajax({
            url: "/user/change-information",
            type: "post",
            enctype: 'multipart/form-data',
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 1000000,
            success: function (jsonResult) {
                if (jsonResult.status === 200 && jsonResult.data === "email") {
                    showNotification('top', 'right', 'Please refill email, email exist!', 3);
                }
                if (jsonResult.status === 200 && jsonResult.data === "Success") {
                    showNotification('top', 'right', 'Change information success', 2);
                }
            },
            error: function (jqXhr, textStatus, errorMessage) {
            }
        });
    }
}

var Order = {
    cancelOrder : function(id) {
        $.ajax({
            url: "/user/cancel-order",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(id),
            dataType: "json",
            success: function (jsonResult) {
                if (jsonResult.status === 200 && jsonResult.data === "Success") {
                    console.log('a')
                    window.location.reload();
                }
            },
            error: function (jqXhr, textStatus, errorMessage) {
            }
        });
    },

    updateStatus : function(id) {
        var data = {};
        data['id'] = id;
        data['status'] = $('input[name="gridRadios'+ id+'"]:checked').val();

        $.ajax({
            url: "/admin/update-status-order",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: function (jsonResult) {
                if (jsonResult.status === 200 && jsonResult.data === "Success") {
                    window.location.reload();
                }
            },
            error: function (jqXhr, textStatus, errorMessage) {
            }
        });
    }

}

function isEmail(email) {
    if (!email) {
        return
    }
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function isVietnamesePhoneNumber(number) {
    if (!number) {
        return
    }
    return /(([03+[2-9]|05+[6|8|9]|07+[0|6|7|8|9]|08+[1-9]|09+[1-4|6-9]]){3})+[0-9]{7}\b/g.test(number);
}