package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Usually left empty or used for GET form display
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            List<UserModel> userLogin = UserController.loginValidate(username, password);

            if (!userLogin.isEmpty()) {
                UserModel user = userLogin.get(0);
                String role = user.getRole();

                request.getSession().setAttribute("user", user);

                switch (role) {
                    case "admin":
                        response.sendRedirect("admindashboard.jsp");
                        break;
                    case "product_manager":
                        response.sendRedirect("pmdashboard.jsp");
                        break;
                    default:
                        response.sendRedirect("Home.jsp");
                        break;
                }

            } else {
                // Invalid login: set error message and forward back to login page
                request.setAttribute("error", "Invalid username or password.");
                request.setAttribute("enteredUsername", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Optional: show a more generic error message to the user
            request.setAttribute("error", "An internal error occurred. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
