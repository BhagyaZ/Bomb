package user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("userID");
        boolean isTrue;

        isTrue = UserController.deleteProfile(id);

        if (isTrue == true) {
//            String alertMessage = "Report deleted successfully";
            response.getWriter().println("<script>window.location.href='index.jsp';</script>");

        } else {
            List<UserModel> userDetails = UserController.getById(id);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
            rd.forward(request, response);
        }
    }
}
