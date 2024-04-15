import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebServlet(name = "IndexServlet", value = "/IndexServlet", loadOnStartup = 1)
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //PRENDERE LA SESSIONE
        HttpSession session = request.getSession();
        if (session.isNew()) {
            session.setAttribute("isLogged", false);
        } else {
            //CONTROLLO SE HO LA LISTA DI PRODOTTI
        }

        //PRENDERE LA LISTA DI PRODOTTI


        //PRENDERE L'UTENTE

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}