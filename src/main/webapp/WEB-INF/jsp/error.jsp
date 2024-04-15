<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Errore</title>
    <link rel="stylesheet" type="text/css" href="assets/css/error.css">
</head>
<body>
    <%@include file="header.jsp"%>

    <%
        String message = (String) request.getAttribute("message");
        System.out.println("MESSAGGIO ERRORE: " + message);
        if (message == null)
            message = "";
    %>

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up" style="margin-top: 10%">
        <span class="">Errore</span>
        <h2 class="">Errore</h2>
        <p><%=message%></p>
    </div><!-- End Section Title -->

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

    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>

</body>
</html>
