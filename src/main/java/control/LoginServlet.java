package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Utente;
import model.dao.UtenteDAO;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = "";
        /*CHECK EMAIL PASSWORD*/

        String email = request.getParameter("email");
        String password = request.getParameter("password");


        Utente utente = UtenteDAO.doRetrieveByEmailPassword(email, password);

        if (utente != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utente", utente);
            session.setAttribute("isLogged", true);
            address = "/IndexServlet";
        } else {
            String message = "Nessun utente trovato!";
            request.setAttribute("message", message);
            address = "/WEB-INF/jsp/error.jsp";
        }



        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}
