package user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean isInserted = UserController.insertdata(username, email, password, phone);

        if (isInserted) {
            // Show success alert and redirect
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Successfully Registered'); window.location.href='login.jsp';</script>");
            //Display in profile
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);

            RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
            rd.forward(request, response);

        } else {
            // Redirect back to form page if insertion fails
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
