package bomb;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InsertCardDetailsServlet")
public class InsertCardDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int number = Integer.parseInt(request.getParameter("number"));
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));
        int cvn = Integer.parseInt(request.getParameter("cvn"));

        CardDetailsController.insertData(name, number, month, year, cvn);

        RequestDispatcher dispatcher = request.getRequestDispatcher("CardDetailsGetAll");
        dispatcher.forward(request, response);
    }
}