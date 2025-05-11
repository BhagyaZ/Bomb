package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected  void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Retrieve user info from session
        UserModel user = (UserModel) request.getSession().getAttribute("user");

        if (user != null) {
            //Forward user data to userProfile
            request.setAttribute("user", user);
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } else {
            //Handle case where user is not logged in
            response.sendRedirect("login.jsp");
        }
    }

}
