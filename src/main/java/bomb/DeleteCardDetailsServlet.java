package bomb;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCardDetailsServlet")
public class DeleteCardDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Not used; deletion is handled via POST
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean isTrue = CardDetailsController.deleteData(id);

        if (isTrue) {
            String alertMessage = "Data Delete Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='CardDetailsGetAll';</script>");
        } else {
            List<CardDetailsModel> carddetails = CardDetailsController.getById(id);
            request.setAttribute("carddetails", carddetails);
            request.getRequestDispatcher("usercarddetails.jsp").forward(request, response);
        }
    }
}