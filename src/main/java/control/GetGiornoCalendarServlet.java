package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Orario;
import model.dao.OrarioDAO;

import java.io.IOException;

@WebServlet(name = "GetGiornoCalendarServlet", value = "/GetGiornoCalendarServlet")
public class GetGiornoCalendarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = "";
        String orarioScelto = request.getParameter("orarioScelto");
        if (orarioScelto.isEmpty() || !orarioScelto.contains("_")) {
            String message = "Errore prenotazione. Riprovare più tardi!";
            request.setAttribute("message", message);
            address = "/WEB-INF/jsp/error.jsp";
        } else {
            String[] orarioSceltoVect = orarioScelto.split("_");
            String orarioString =  orarioSceltoVect[1].replaceAll("\\s", "");
            System.out.println("ORARIO: " + orarioString);
            String orario[] = orarioString.split("-");
            Orario o = OrarioDAO.doRetrieveByInizioFine(orario[0], orario[1]);

            HttpSession session = request.getSession();
            session.setAttribute("isSceltaOrario", true);
            session.setAttribute("giornoScelto", orarioSceltoVect[0]);
            session.setAttribute("orarioScelto", o);

            address = "/WEB-INF/jsp/riepilogoPrenotazione.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}