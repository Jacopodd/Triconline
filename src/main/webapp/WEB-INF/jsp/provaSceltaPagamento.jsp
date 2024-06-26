<%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 11/04/2024
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Pagamento</title>
    <link rel="stylesheet" href="./assets/css/formPagamento.css"/>
</head>
<body>
    <%@include file="header.jsp"%>
    <!-- FORM PAGAMENTO-->
    <div class="main-back">
        <div class="container m-auto bg-white p-5 bod-3">
            <div class="row">
                <!-- CARD FORM -->
                <div class="col-lg-8 col-md-12">
                    <form>
                        <!-- TriconlinePay-->
                        <div class="header flex-between flex-vertical-center">
                            <div class="flex-vertical-center">
                                <i class="ai-bitcoin-fill size-xl pr-sm f-main-color"></i>
                                <span class="title">
                      <strong>Triconline</strong><span>Pay</span>
                    </span>
                            </div>
                        </div>
                        <div class="card-data flex-fill flex-vertical">
                            <!-- Card Number -->
                            <div class="flex-between flex-vertical-center">
                                <div class="card-property-title">
                                    <strong>Numero Carta</strong>
                                    <span>Inserisci il numero della carta di 16 cifre</span>
                                </div>
                            </div>

                            <!-- Card Field -->
                            <div class="flex-between">
                                <div class="card-number flex-vertical-center flex-fill">
                                    <div class="card-number-field flex-vertical-center flex-fill">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="24px" height="24px">
                                            <path fill="#ff9800" d="M32 10A14 14 0 1 0 32 38A14 14 0 1 0 32 10Z" />
                                            <path fill="#d50000" d="M16 10A14 14 0 1 0 16 38A14 14 0 1 0 16 10Z" />
                                            <path fill="#ff3d00" d="M18,24c0,4.755,2.376,8.95,6,11.48c3.624-2.53,6-6.725,6-11.48s-2.376-8.95-6-11.48 C20.376,15.05,18,19.245,18,24z" />
                                        </svg>
                                        <input type="text" placeholder="Numero Carta" class="form-control" id="cardNumber" onkeypress="return onlyNumberKey(event)" maxlength="19" name="cardNumber" data-bound="carddigits_mock" data-def="0000 0000 0000 0000" required />
                                    </div>
                                    <i class="ai-circle-check-fill size-lg f-main-color"></i>
                                </div>
                            </div>

                            <!-- Expiry Date -->
                            <div class="flex-between">
                                <div class="card-property-title">
                                    <strong>Data di Scadenza</strong>
                                    <span>Inserisci la data di scadenza della carta</span>
                                </div>
                                <div class="card-property-value flex-vertical-center">
                                    <div class="input-container half-width">
                                        <input class="numbers month-own" data-def="00" type="text" data-bound="mm_mock" placeholder="MM" />
                                    </div>
                                    <span class="m-md">/</span>
                                    <div class="input-container half-width">
                                        <input class="numbers year-own" data-def="01" type="text" data-bound="yy_mock" placeholder="YYYY" />
                                    </div>
                                </div>
                            </div>

                            <!-- CCV Number -->
                            <div class="flex-between">
                                <div class="card-property-title">
                                    <strong>CVC Number</strong>
                                    <span>Inserisci il codice di verifica dal retro della carta</span>
                                </div>
                                <div class="card-property-value">
                                    <div class="input-container">
                                        <input id="cvc" placeholder="CVV" maxlength="3" onkeypress="return onlyNumberKey(event)" type="password" />
                                        <i id="cvc_toggler" data-target="cvc" class="ai-eye-open pointer"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Name -->
                            <div class="flex-between">
                                <div class="card-property-title">
                                    <strong>Nome Proprietario</strong>
                                    <span>Inserisci il nome del proprietario della carta</span>
                                </div>
                                <div class="card-property-value">
                                    <div class="input-container">
                                        <input id="name" data-bound="name_mock" data-def="Mr. Cardholder" type="text" class="uppercase" placeholder="NOME PROPRIETARIO" />
                                        <i class="ai-person"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Numero telefono -->
                            <div class="flex-between">
                                <div class="card-property-title">
                                    <strong>Numero di telefono</strong>
                                    <span>Inserisci il numero di telefono</span>
                                </div>
                                <div class="card-property-value">
                                    <div class="input-container">
                                        <input id="phone" type="text" placeholder="Il tuo numero di telefono" />
                                        <i class="ai-phone"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="action flex-center">
                            <button type="submit" class="b-main-color pointer">
                                Paga Ora
                            </button>
                        </div>
                    </form>
                </div>

                <!-- SIDEBAR -->
                <div class="col-lg-4 col-md-12 py-5">
                    <div></div>
                    <div class="purchase-section flex-fill flex-vertical">
                        <div class="card-mockup flex-vertical">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="40px" height="40px">
                                <path fill="#ff9800" d="M32 10A14 14 0 1 0 32 38A14 14 0 1 0 32 10Z" />
                                <path fill="#d50000" d="M16 10A14 14 0 1 0 16 38A14 14 0 1 0 16 10Z" />
                                <path fill="#ff3d00" d="M18,24c0,4.755,2.376,8.95,6,11.48c3.624-2.53,6-6.725,6-11.48s-2.376-8.95-6-11.48 C20.376,15.05,18,19.245,18,24z" />
                            </svg>
                            <div>
                                <strong>
                                    <div id="name_mock" class="size-md pb-sm uppercase ellipsis">
                                        mr. Cardholder
                                    </div>
                                </strong>
                                <div class="size-md pb-md">
                                    <strong>
                                        <span id="carddigits_mock">0000 0000 0000 0000</span>
                                    </strong>
                                </div>
                                <div class="flex-between flex-vertical-center">
                                    <strong class="size-md">
                                        <span>Data di scadenza : </span><span id="mm_mock">00</span> / <span id="yy_mock">00</span>
                                    </strong>

                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="40px" height="40px">
                                        <path fill="#1565C0" d="M45,35c0,2.209-1.791,4-4,4H7c-2.209,0-4-1.791-4-4V13c0-2.209,1.791-4,4-4h34c2.209,0,4,1.791,4,4V35z" />
                                        <path fill="#FFF" d="M15.186 19l-2.626 7.832c0 0-.667-3.313-.733-3.729-1.495-3.411-3.701-3.221-3.701-3.221L10.726 30v-.002h3.161L18.258 19H15.186zM17.689 30L20.56 30 22.296 19 19.389 19zM38.008 19h-3.021l-4.71 11h2.852l.588-1.571h3.596L37.619 30h2.613L38.008 19zM34.513 26.328l1.563-4.157.818 4.157H34.513zM26.369 22.206c0-.606.498-1.057 1.926-1.057.928 0 1.991.674 1.991.674l.466-2.309c0 0-1.358-.515-2.691-.515-3.019 0-4.576 1.444-4.576 3.272 0 3.306 3.979 2.853 3.979 4.551 0 .291-.231.964-1.888.964-1.662 0-2.759-.609-2.759-.609l-.495 2.216c0 0 1.063.606 3.117.606 2.059 0 4.915-1.54 4.915-3.752C30.354 23.586 26.369 23.394 26.369 22.206z" />
                                        <path fill="#FFC107" d="M12.212,24.945l-0.966-4.748c0,0-0.437-1.029-1.573-1.029c-1.136,0-4.44,0-4.44,0S10.894,20.84,12.212,24.945z" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <ul class="purchase-props">
                            <li class="flex-between">
                                <span>Compagnie</span>
                                <strong>Triconline</strong>
                            </li>
                            <!--<li class="flex-between">
                                <span>Numero ordine</span>
                                <strong>429252965</strong>
                            </li>-->
                            <li class="flex-between">
                                <span>Prodotto</span>
                                <strong>Consulenza</strong>
                            </li>
                            <li class="flex-between">
                                <span>Riepilogo</span>
                                <strong>Consulenza giorno: 04/04/2024 alle ore 11:30</strong>
                            </li>
                            <!--<li class="flex-between">
                                <span>VAT (20%)</span>
                                <strong>$100.00</strong>
                            </li>-->
                        </ul>
                    </div>
                    <div class="separation-line"></div>
                    <div class="total-section flex-between flex-vertical-center">
                        <div class="flex-fill flex-vertical">
                            <div class="total-label f-secondary-color">Devi pagare</div>
                            <div>
                                <strong>29</strong>
                                <small>.99 <span class="f-secondary-color">EUR</span></small>
                            </div>
                        </div>
                        <i class="ai-coin size-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- partial -->
    <script src="./assets/js/formPagamento.js"></script>
</body>
</html>
