<%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 26/03/2024
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Login</title>
    <link rel="stylesheet" href="assets/css/form.css">
</head>
<body>
<%@include file="header.jsp"%>

<main class="main">

    <!-- Contact Section -->
    <section id="contact" class="contact section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span class="">Registrazione</span>
            <h2 class="">Registrazione</h2>
            <p>Effettua la registrazione per poter acquistare i nostri prodotti</p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <form action="RegistrazioneServlet" method="post" class="formAuth">
                <div class="row gy-2">

                    <div class="col-md-2 ">
                        <input type="text" class="form-control" name="nome" placeholder="Nome" required="" id="nomeId">
                    </div>

                    <div class="col-md-2 ">
                        <input type="text" class="form-control" name="codiceFiscale" placeholder="CodiceFiscale" required="" id="codiceFiscaleId">
                    </div>

                    <div class="col-md-2 ">
                        <input type="tel" class="form-control" name="numero" placeholder="Numero di telefono" required="" id="numeroId">
                    </div>

                    <div class="col-md-4 ">
                        <input type="text" class="form-control" name="via" placeholder="Via" required="" id="viaId">
                    </div>

                    <div class="col-md-2 ">
                        <input type="number" class="form-control" name="cap" placeholder="Cap" required="" id="capId">
                    </div>

                    <div class="col-md-4 ">
                        <input type="text" class="form-control" name="paese" placeholder="Paese" required="" id="paeseId">
                    </div>

                    <div class="col-md-4 ">
                        <input type="email" class="form-control" name="email" placeholder="Email" required="" id="emailId">
                    </div>

                    <div class="col-md-4">
                        <input type="password" class="form-control" name="password" placeholder="Password" required="" id="passwordId">
                    </div>


                    <div class="col-md-12 text-center">
                        <div class="loading">Caricamento</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>

                        <button type="submit">Registrati</button>

                        <div class="container section-title" data-aos="fade-up">
                            <a href="login.jsp"><p>Sei già registrato? Accedi qui!</p></a>
                        </div>
                    </div>

                </div>
            </form>

        </div>

        </div>

    </section><!-- /Contact Section -->

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
