<%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 15/04/2024
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Login</title>
    <script type="application/javascript" src="assets/js/validation.js"></script>
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
    <%@include file="header.jsp"%>

    <main class="main" style="margin-top: 10%">
        <div class="wrapper">
            <div class="text-center mt-4 name">
                Triconline
            </div>
            <form class="p-3 mt-3" action="LoginServlet" method="post">
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-user"></span>
                    <input type="text" name="email" id="userName" placeholder="Email">
                </div>
                <div class="form-field d-flex align-items-center">
                    <span class="fas fa-key"></span>
                    <input type="password" name="password" id="pwd" placeholder="Password">
                </div>
                <button class="btn mt-3">Login</button>
            </form>
            <div class="text-center fs-6">
                <a href="#">Password dimenticata?</a> or <a href="RegistrazioneRedirectServlet">Registrati</a>
            </div>
        </div>

    </main>




    <%@include file="footer.jsp"%>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

    <script>
        function validate() {
            var email = document.getElementById("emailId").value;
            var password = document.getElementById("passwordId").value;

            return emailValidate(email) && passwordValidate(password);
        }
    </script>

    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>

</body>
</html>
