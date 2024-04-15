<%@ page import="model.Utente" %><%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 11/04/2024
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Index - Day Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="./assets/img/favicon.png" rel="icon">
    <link href="./assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="./assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="./assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="./assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="./assets/css/main.css" rel="stylesheet">
</head>
    <body>
        <header id="header" class="header fixed-top">

            <!-- BAR CON EMAIL E NUMERO DI TELEFONO-->
            <div class="topbar d-flex align-items-center">
                <div class="container d-flex justify-content-center justify-content-md-between">
                    <div class="contact-info d-flex align-items-center">
                        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
                        <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
                    </div>
                    <div class="social-links d-none d-md-flex align-items-center">
                        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div><!-- End Top Bar -->


            <div class="branding">

                <di class="container position-relative d-flex align-items-center justify-content-between">
                    <a href="index.html" class="logo d-flex align-items-center">
                        <!-- Uncomment the line below if you also wish to use an image logo -->
                        <img src="assets/img/logoTrico.png" alt="">
                        <!--<h1 class="">Day</h1>-->
                    </a>

                    <!-- NAV MENU -->
                    <nav id="navmenu" class="navmenu">
                        <ul>
                            <li><a href="#hero" class="">Home</a></li>
                            <li><a href="#about">Su di noi</a></li>
                            <li><a href="#services">Servizi</a></li>
                            <li class="dropdown has-dropdown"><a href="#portfolio"><span>Shop</span> <i class="bi bi-chevron-down"></i></a>
                                <ul>
                                    <li><a href="#">Uomo</a></li>
                                    <li><a href="#">Donna</a></li>
                                    <li><a href="#">Estate</a></li>
                                </ul>
                            </li>

                            <%
                                Utente utente = (Utente) session.getAttribute("utente");
                                if(utente == null) {
                            %><li><a href="LoginRedirectServlet">Login</a></li>
                            <%
                            } else {
                                if (utente.isAdmin()) {
                            %><li><a href="AdminPageRedirectServlet">Admin</a></li> <!-- CAMBIARE -->
                            <%
                            } else {
                            %><li><a href="${pageContext.request.contextPath}/LogoutServlet">Account</a></li> <!-- CAMBIARE -->
                            <%
                                    }
                                }
                            %>


                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>

                </di>
            </div>

        </header>
    </body>
</html>
