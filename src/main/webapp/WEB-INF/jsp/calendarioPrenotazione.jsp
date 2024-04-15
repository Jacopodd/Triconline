<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="model.dao.OrarioDAO" %>
<%@ page import="model.Orario" %>
<%@ page import="model.dao.PrenotazioneDAO" %>
<%@ page import="model.Prenotazione" %>
<%@ page import="control.CalendarUtils" %><%--
  Created by IntelliJ IDEA.
  User: Jacopo
  Date: 07/04/2024
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Triconline - Prenotazione Conferenza</title>
    <link rel="stylesheet" href="assets/css/calendario.css">
    <link rel="stylesheet" href="assets/css/alertPrenotazione.css">
    <style>
        .table-container {
            max-width: 100%;
            margin: 20px auto;
            border: 2px solid #ccc;
            border-radius: 8px;
            overflow-x: auto;
            white-space: nowrap;
            /*overflow: hidden;*/
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .calendar-body {
            /*display: flex;
            justify-content: space-between;*/
            display: grid;
            grid-template-columns: repeat(7, minmax(100px, 1fr)); /* Imposta 7 colonne flessibili */
            /*grid-template-columns: repeat(7, 1fr);*/
            /*grid-template-columns: repeat(7, 100px);*/ /* Imposta esattamente 7 colonne di larghezza 100px ciascuna */
            gap: 10px;
            padding: 20px;
            overflow-x: auto; /* Abilita lo scrolling orizzontale se il contenuto supera la larghezza del contenitore */
            white-space: nowrap; /* Impedisce il wrapping del contenuto su più righe */
        }

        .calendar-day {
            /*min-width: 100px;*/ /* Imposta una larghezza minima per ogni cella */
            /*flex: 1;
            text-align: center;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-sizing: border-box;*/ /* Assicura che il padding sia incluso nella larghezza minima */
            padding: 10px;
            text-align: center;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .day-number {
            font-size: 20px;
            font-weight: bold;
        }

        .day-info {
            margin-top: 5px;
            font-size: 14px;
            color: #666;
        }

        /* Media query per rendere il calendario responsive */
        @media (max-width: 768px) {
            .table-container {
                overflow-x: auto;
                white-space: nowrap;
            }

            .calendar-body {
                grid-template-columns: repeat(7, 1fr); /* Modifica il layout a una colonna per dispositivi più piccoli */
            }
        }

        @media (max-width: 480px) {
            .header-title {
                font-size: 20px; /* Riduci la dimensione del titolo del calendario */
            }

            .calendar-day {
                padding: 8px; /* Riduci il padding dei giorni per adattarsi meglio ai dispositivi mobili */
            }
        }

        @media (max-width: 600px) {
            .calendar-day {
                grid-template-columns: repeat(5, minmax(100px, 1fr)); /* Riduci il numero di colonne per dispositivi più piccoli */            }
        }



        .scegliOrarioForm button {
            background-color: #5a9ca2;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>

    <%
        String selectedYear = (String) session.getAttribute("selectedYear");
        String selectedMonth = (String) session.getAttribute("selectedMonth");
        String currentMonthName = "";
        int currentMonth;
        int currentYear;
        LocalDate firstDayOfMonth = LocalDate.of(Integer.parseInt(selectedYear), Integer.parseInt(selectedMonth), 1);
        currentMonth = firstDayOfMonth.getMonthValue();
        currentMonthName = firstDayOfMonth.getMonth().toString();
        currentYear = Integer.parseInt(selectedYear);

        session.setAttribute("selectedYear", currentYear + "");
        session.setAttribute("selectedMonth", currentMonth + "");
        //System.out.println("MESE: " + currentMonthName + " ANNO: " + currentYear);

        // Ottieni l'ultimo giorno del mese corrente
        LocalDate lastDayOfMonth = firstDayOfMonth.with(java.time.temporal.TemporalAdjusters.lastDayOfMonth());

        List<LocalDate> daysOfMonth = new ArrayList<>();

        // Aggiungi tutti i giorni del mese alla lista
        LocalDate temp = firstDayOfMonth;
        while (!temp.isAfter(lastDayOfMonth)) {
            daysOfMonth.add(temp);
            temp = temp.plusDays(1); // Vai al giorno successivo
        }

    %>


    <main class="main" style="margin: 10%">
        <!-- CALENDADIO -->
        <div class="table-container">

            <div class="table-header">
                <form method="post" action="CalendarRedirectingServlet" class="header-button">
                    <input type="submit" name="changeMese" value="←">
                </form>
                <h1 class="header-title"><%=currentMonthName%> <%=currentYear%></h1>
                <form method="post" action="CalendarRedirectingServlet" class="header-button">
                    <input type="submit" name="changeMese" value="→">
                </form>
            </div>

            <div class="sub-header">
                <div class="column-title">Lun</div>
                <div class="column-title">Mar</div>
                <div class="column-title">Mer</div>
                <div class="column-title">Gio</div>
                <div class="column-title">Ven</div>
                <div class="column-title" style="color: darkred">Sab</div>
                <div class="column-title" style="color: darkred">Dom</div>
            </div>

            <div class="calendar-body">

                <!-- SETTO IL PRIMO GIORNO DELLA SETTIMANA NEL POSTO GIUSTO -->
                <%
                    int weekdayIndex = firstDayOfMonth.getDayOfWeek().getValue(); // Ottieni l'indice del primo giorno della settimana
                    //System.out.println("INDICE PRIMO GIORNO: " + weekdayIndex);
                    int currentDayOfWeek = 1; // Inizia con Lunedì (1) e aumenta fino a Domenica (7)
                    int emptyCellsCount = weekdayIndex - 1; // Numero di celle vuote prima del primo giorno del mese

                    // Stampa le celle vuote per raggiungere il primo giorno del mese
                    for(int i = 0; i < emptyCellsCount; i++) {
                %>
                    <div class="calendar-day">
                        <div class="day-number"></div>
                        <div class="day-info"></div>
                    </div>
                <%
                    }
                %>

                <!-- CREO LA CARD PER IL GIORNO -->
                <%
                    List<Orario> orari = OrarioDAO.doRetrieveAll();
                    List<Prenotazione> prenotazioni = CalendarUtils.getPrenotazioniByMese(currentMonth);
                    //System.out.println("PRENOTAZIONI " + currentMonthName + ": " + prenotazioni.size());
                    for(LocalDate day : daysOfMonth) {
                        //System.out.println("PROVAAAAAAAAAAAAAAAA " + day);
                        if (CalendarUtils.isWeekend(day)) {
                %>

                            <div class="calendar-day" style="background-color: darkred" onclick="giornoFestivoClick()">
                                <div class="day-number" style="color: white"><%=day.getDayOfMonth()%></div>
                                <div class="day-info" style="color: white">Festivo</div>
                            </div>
                <%
                        } else {
                            //System.out.println("PORCO DIO: " + day.getDayOfMonth());
                            List<Prenotazione> prenotazioniGiorno = CalendarUtils.getDisponibilitaGiorno(currentYear, currentMonth,  day.getDayOfMonth(), prenotazioni);
                            System.out.println("PRENOTAZIONI GIORNO: " + day.getDayOfMonth() + " = " + prenotazioniGiorno.size());
                            if(prenotazioniGiorno.size() == orari.size()) {
                %>

                            <div class="calendar-day" style="background-color: darkred" onclick="giornoPienoClick()">
                                <div class="day-number" style="color: white"><%=day.getDayOfMonth()%></div>
                                <div class="day-info" style="color: white">Giorno Pieno</div>
                            </div>
                <%
                            } else {
                                List<Orario> orariDisponibili = CalendarUtils.getOrariDisponibili(prenotazioniGiorno, orari);
                                System.out.println("SIZE ORARI DISPONIBILI: " + orariDisponibili.size());
                %>

                            <div class="calendar-day" onclick="giornoDisponibileClick(<%=day.getDayOfMonth()%>, <%=currentMonth%>, <%=currentYear%>)">
                                <div class="day-number" id="giornoScelto"><%=day.getDayOfMonth()%></div>
                                <div class="day-info" id="day-info-<%=day.getDayOfMonth()%>">
                                    <%
                                        for(Orario o : orariDisponibili) {
                                            System.out.println("ORARIO GIORNO: " + day.getDayOfMonth() + " " + o.getInizio() + "-" + o.getFine());
                                    %>
                                            <%=o.getInizio()%>-<%=o.getFine()%><br>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>

                <%
                            }
                %>

                <%
                        }
                %>

                <%
                    }
                %>
            </div>

        </div>

        <div class="custom-alert" id="alertFerie" style="background-color: darkred">
            <div class="alert-content">
                <span class="close-btn" onclick="closeAlert('alertFerie')" style="color: white">×</span>
                <h2 style="color: white">Questo giorno è festivo</h2>
                <p style="color: white">Questo è un giorno festivo, non è possibile effettuare la consulenza.<br>Le consulenze si effettuano solo dal Lunedì al Venerdì.</p>
            </div>
        </div>

        <div class="custom-alert" id="alertPieno" style="background-color: darkred">
            <div class="alert-content">
                <span class="close-btn" onclick="closeAlert('alertPieno')" style="color: white">×</span>
                <h2 style="color: white">Questo giorno è pieno</h2>
                <p style="color: white">Tutto il giorno è prenotato.<br>Scegli un altro giorno dal Lunedì al Venerdì.</p>
            </div>
        </div>

        <div class="custom-alert" id="alertScelta">
            <div class="alert-content">
                <span class="close-btn" onclick="closeAlert('alertScelta')">×</span>
                <h2 >Scegli l'orario</h2>
                <p>Sono disponibili i seguenti orari.<br>Scegli quello che preferisci</p>
                <div id="orariContainer"></div>
                <form id="scegliOrarioForm" action="GetGiornoCalendarServlet" method="post"></form>
            </div>
        </div>
    </main>

    <!-- SCRIPT ALERT -->
    <script>
        function giornoFestivoClick() {
            var festivoAlert = document.getElementById("alertFerie");
            festivoAlert.style.display = "block";
        }

        function giornoPienoClick() {
            var pienoAlert = document.getElementById("alertPieno");
            pienoAlert.style.display = "block";
        }

        function giornoDisponibileClick(dayId, month, year) {
            var sceltaAlert = document.getElementById("alertScelta");
            sceltaAlert.style.display = "block";

            var orariDiv = document.getElementById("day-info-" + dayId);
            var orariContent = orariDiv.innerHTML; // Otteniamo il contenuto HTML del div

            // Dividiamo il contenuto in righe separate
            var orariArray = orariContent.split("<br>").filter(function (orario) {
                return orario.trim() !== ""; // Rimuovi elementi vuoti
            });

            var form = document.getElementById("scegliOrarioForm");

            // Rimuovi eventuali pulsanti precedenti
            form.innerHTML = '';

            // Itera su ogni orario nell'array
            orariArray.forEach(function (orario) {
                var nuovoPulsante = document.createElement("button");
                nuovoPulsante.type = "submit";
                nuovoPulsante.textContent = orario;
                //nuovoPulsante.value = orario;
                nuovoPulsante.value = dayId + "/" + month + "/" + year + "_" + orario;
                //nuovoPulsante.name = "orario-" + dayId + "/" + month + "/" + year + "-" + orario;
                nuovoPulsante.name = "orarioScelto"

                // Applica stili CSS per posizionare i pulsanti uno sotto l'altro
                nuovoPulsante.style.display = "block"; // Imposta il pulsante come blocco
                nuovoPulsante.style.marginBottom = "5px"; // Aggiungi margine inferiore per separazione
                nuovoPulsante.style.backgroundColor = "#5a9ca2";
                nuovoPulsante.style.borderRadius = "8px";

                // Aggiungi il pulsante al form
                form.appendChild(nuovoPulsante);
            });


        }

        function closeAlert(tipo) {
            var customAlert = document.getElementById(tipo);
            customAlert.style.display = 'none';
        }
    </script>

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
