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

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try{
            List<UserModel> userLogin = UserController.loginValidate(username, password);

            if (!userLogin.isEmpty()) {
                UserModel user = userLogin.get(0);
                String role = user.getRole();

                if (role.equals("admin")) {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("admindashboard.jsp");
                } else if (role.equals("product_manager")) {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("pmdashboard.jsp");
                } else {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("home.jsp");
                }

            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
