package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.IndirizzoSpedizione;
import model.Utente;
import model.dao.IndirizzoSpedizioneDAO;
import model.dao.UtenteDAO;

import java.io.IOException;

@WebServlet(name = "RegistrazioneServlet", value = "/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*CHECK EMAIL PASSWORD*/
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String paese = request.getParameter("paese");
        String numero = request.getParameter("numero");

        System.out.println("UTENTE: " + nome + " " + email + " " + password);
        Utente utente = new Utente();

        utente.setAll(nome, email, password, false);
        UtenteDAO.doSave(utente);

        IndirizzoSpedizione indirizzoSpedizione = new IndirizzoSpedizione();
        utente = UtenteDAO.doRetrieveByEmailPassword(email, password);
        indirizzoSpedizione.setAll(utente.getId(), via, cap, paese, numero, true);
        IndirizzoSpedizioneDAO.doSave(indirizzoSpedizione);


        HttpSession session = request.getSession();
        session.setAttribute("utente", utente);
        session.setAttribute("isLogged", true);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
        dispatcher.forward(request, response);
    }
}
