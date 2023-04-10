<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
    <title>Contact V8</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <jsp:include page="/WEB-INF/views/user/common/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!--===============================================================================================-->
</head>
<body>

<jsp:include page="/WEB-INF/views/user/common/header.jsp"></jsp:include><div class="bg-black-menu">
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li ><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li ><a href="${pageContext.request.contextPath}/shop">Shop page</a></li>
                        <li><a href="${pageContext.request.contextPath}/single-product">Single product</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/checkout">Checkout</a></li>
                        <!-- <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li> -->
                        <li class="active"><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<div class="container-contact100">
    <div class="contact100-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d391.4726495361806!2d105.84317624908874!3d21.01921843602022!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab8fd7aa82af%3A0x17710cf525f36606!2zQ-G6o25oIFPDoXQgSMOsbmggU-G7sSBIw6AgTuG7mWkgKFBDNDUp!5e0!3m2!1svi!2s!4v1639837508314!5m2!1svi!2s" width="100%" height="100%" style="border:0;" allowfullscreen="true" loading="lazy"></iframe>
    </div>

    <div class="wrap-contact100">
        <form class="contact100-form validate-form" action="${pageContext.request.contextPath}/contact" method="post" >
				<span class="contact100-form-title">
					Liên hệ cửa hàng
				</span>

            <div class="wrap-input100 validate-input" data-validate="Bắt buộc nhập họ tên!">
                <input class="input100" type="text" name="name" id="name" placeholder="Họ và tên">
                <span class="focus-input100-1"></span>
                <span class="focus-input100-2"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate = "Email chưa hợp lệ! ví dụ: ex@abc.xyz">
                <input class="input100" type="text" name="email" id="email" placeholder="Email">
                <span class="focus-input100-1"></span>
                <span class="focus-input100-2"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate = "Số điện thoại chưa hợp lệ!">
                <input class="input100" type="text" name="phone" id="phone" placeholder="Số điện thoại">
                <span class="focus-input100-1"></span>
                <span class="focus-input100-2"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate = "Bắt buộc nhập ghi chú!">
                <textarea class="input100" name="message" id="message" placeholder="Ghi chú"></textarea>
                <span class="focus-input100-1"></span>
                <span class="focus-input100-2"></span>
            </div>

            <div class="contact100-form-checkbox">
                <input class="input-checkbox100" id="ckb1" type="checkbox" name="copy-mail">
                <label class="label-checkbox100" for="ckb1">
                    Gửi bản sao tới tôi
                </label>
            </div>

            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn">
                    Gửi phản hồi
                </button>
            </div>
        </form>
    </div>
</div>
<%-- <div class="container">
    <div class="content-footer m-0">
        <div class="left float-left">
            <h3>Đăng kí nhận thông tin</h3>
        </div>
        <div class="right float-right">
            <form class="form-inline"
                action="${pageContext.request.contextPath}/" method="post">
                <div class="input-group mb-2 mr-sm-2">
                    <input type="text" class="form-control" id="emailfield"
                        placeholder="Email" />
                </div>
                <button type="submit" class="btn btn-info mb-2">Subcribe</button>
            </form>
        </div>
    </div>
</div>
</div> --> --%>
<jsp:include page="/WEB-INF/views/user/common/footer.jsp"></jsp:include>
<div class="social d-none d-lg-block">
    <a href="https://www.facebook.com/tuananhtb99/"><i
            class="fab fa-facebook-f"></i></a> <a
        href="https://www.facebook.com/tuananhtb99/"><i
        class="fab fa-twitter"></i></a> <a
        href="https://www.instagram.com/tuan_oliver/?hl=vi"><i
        class="fab fa-instagram"></i></a> <a
        href="https://www.facebook.com/tuananhtb99/"><i
        class="fab fa-youtube"></i></a>
</div>



<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
<!--===============================================================================================-->
<script src="../js/main.js"></script>
<script src="../js/contact.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-23581568-13');
</script>

</body>
<jsp:include page="/WEB-INF/views/user/common/js.jsp"></jsp:include>
</html>