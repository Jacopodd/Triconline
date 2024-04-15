<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 27/03/2024
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Triconline - Admin Page</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
    <style>
        .main{
            margin-top: 5%;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <main class="main">

        <%
            Calendar c = Calendar.getInstance();
            int currentMonth = c.get(Calendar.MONTH) + 1;
            int currentYear = c.get(Calendar.YEAR);
        %>

        <section id="services" class="services section">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span class="">Ciao <%=utente.getNome()%></span>
                <h2>Ciao <%=utente.getNome()%></h2>
                <p>Benvenuto nella pagina Admin. Da qui puoi gestire tutto!</p>
            </div><!-- End Section Title -->

            <div class="container">

                <div class="row gy-4">

                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="service-item  position-relative">
                            <div class="icon">
                                <i class="bi bi-calendar"></i>
                            </div>
                            <a href="consulenzePage.jsp" class="stretched-link"> <!--consulenzePage.jsp-->
                                <h3>Consulenze</h3>
                            </a>
                            <p>Gestisci le consulenze.</p>
                        </div>
                    </div><!-- End Service Item -->

                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="service-item position-relative">
                            <div class="icon">
                                <i class="bi bi-calendar"></i>
                            </div>
                            <a href="#" class="stretched-link">
                                <h3>Acquista in autonomia</h3>
                            </a>
                            <p>Acquista i prodotti che più desideri in autonomia. Consigliamo di effettuare una consulenza per non sbagliare.</p>
                        </div>
                    </div><!-- End Service Item -->

                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                      <div class="service-item position-relative">
                        <div class="icon">
                          <i class="bi bi-box-arrow-left"></i>
                        </div>
                        <a href="LogoutServlet" class="stretched-link">
                          <h3>Logout</h3>
                        </a>
                        <p>Da qui puoi effettuare il Logout.</p>
                      </div>
                    </div><!-- End Service Item -->

                    <!--<div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                      <div class="service-item position-relative">
                        <div class="icon">
                          <i class="bi bi-bounding-box-circles"></i>
                        </div>
                        <a href="#" class="stretched-link">
                          <h3>Asperiores Commodit</h3>
                        </a>
                        <p>Non et temporibus minus omnis sed dolor esse consequatur. Cupiditate sed error ea fuga sit provident adipisci neque.</p>
                        <a href="#" class="stretched-link"></a>
                      </div>
                    </div>--><!-- End Service Item -->

                    <!--<div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
                      <div class="service-item position-relative">
                        <div class="icon">
                          <i class="bi bi-calendar4-week"></i>
                        </div>
                        <a href="#" class="stretched-link">
                          <h3>Velit Doloremque</h3>
                        </a>
                        <p>Cumque et suscipit saepe. Est maiores autem enim facilis ut aut ipsam corporis aut. Sed animi at autem alias eius labore.</p>
                        <a href="#" class="stretched-link"></a>
                      </div>
                    </div>--><!-- End Service Item -->

                    <!--<div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
                      <div class="service-item position-relative">
                        <div class="icon">
                          <i class="bi bi-chat-square-text"></i>
                        </div>
                        <a href="#" class="stretched-link">
                          <h3>Dolori Architecto</h3>
                        </a>
                        <p>Hic molestias ea quibusdam eos. Fugiat enim doloremque aut neque non et debitis iure. Corrupti recusandae ducimus enim.</p>
                        <a href="#" class="stretched-link"></a>
                      </div>
                    </div>--><!-- End Service Item -->

                </div>

            </div>

        </section><!-- /Services Section -->
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

    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>
</html>
