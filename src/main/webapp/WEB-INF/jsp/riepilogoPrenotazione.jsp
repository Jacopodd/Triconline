<%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 11/04/2024
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Riepilogo Prenotazione</title>
    <link rel="stylesheet" href="./assets/css/formPagamento2.css"/>
</head>
<body>
    <%@include file="header.jsp"%>

    <main class="main" style="margin-top: 10%">
      <section id="contact" class="contact section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <span class="">Riepilogo</span>
          <h2 class="">Riepilogo</h2>
          <p>Ecco un breve riepilogo sulla prenotazione della tua consulenza</p>
        </div><!-- End Section Title -->

        <!-- INSERIRE RIEPILOGO -->

        <!-- FORM PAGAMENTO-->
        <div class="container" data-aos="fade-up" data-aos-delay="100" style="display: flex; justify-content: center; align-items: center; width: 100%;">
            <div class="col-lg-6">
              <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="400">
                <div class="container section-title" data-aos="fade-up">
                  <span class="">Metodo di Pagamento</span>
                  <h3 class="">Metodo di Pagamento</h3>
                </div><!-- End Section Title -->


                <div class="row gy-4">

                  <div class="col-md-12">
                    <input type="text" class="form-control" name="numeroCarta" placeholder="Numero Carta" required="">
                  </div>

                  <div class="col-md-4">
                    <input type="number" name="meseScadenza" class="form-control" placeholder="Mese di scadenza" required="">
                  </div>

                  <div class="col-md-4">
                    <input type="number" class="form-control" name="annoScadenza" placeholder="Anno di scadenza" required="">
                  </div>

                  <div class="col-md-2">
                    <input type="number" class="form-control" name="cvv" placeholder="CVV" required="">
                  </div>

                  <div class="col-md-6">
                    <input type="text" class="form-control" name="name" placeholder="Nome proprietario" required="">
                  </div>

                  <div class="col-md-12">
                    <textarea class="form-control" name="message" rows="6" placeholder="Messagio" required=""></textarea>
                  </div>

                  <div class="col-md-12 text-center">
                    <button type="submit">Paga ora</button>
                  </div>

                </div>
              </form>
            </div><!-- End Contact Form -->

          </div>



      </section>
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
