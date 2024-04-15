package control.redirecting;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "CalendarRedirectServlet", value = "/CalendarRedirectServlet")
public class CalendarRedirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        String currentMonthName = currentDate.getMonth().toString();
        int currentYear = currentDate.getYear();

        HttpSession session = request.getSession();

        session.setAttribute("selectedYear", currentYear + "");
        session.setAttribute("selectedMonth", currentMonth + "");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/calendarioPrenotazione.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}