package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "CalendarRedirectingServlet", value = "/CalendarRedirectingServlet")
public class CalendarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int selectedYear = Integer.parseInt((String) session.getAttribute("selectedYear"));
        int selectedMonth = Integer.parseInt((String) session.getAttribute("selectedMonth"));
        System.out.println("SERLVET - MESE: " + selectedMonth + " ANNO: " + selectedYear);

        String changeMese = request.getParameter("changeMese");

        if(changeMese.equals("←")) {
            if(selectedMonth == 1) {
                selectedMonth = 12;
                selectedYear--;
            } else selectedMonth--;
        } else {
            if(selectedMonth == 12) {
                selectedMonth = 1;
                selectedYear++;
            } else selectedMonth++;
        }

        String monthString = selectedMonth + "";
        String yearString = selectedYear + "";

        session.setAttribute("selectedMonth", monthString);
        session.setAttribute("selectedYear", yearString);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/calendarioPrenotazione.jsp");
        dispatcher.forward(request, response);
    }
}