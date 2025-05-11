package user;

import jakarta.servlet.RequestDispatcher;
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

        System.out.println(username);
        System.out.println(password);

        try {
            List<UserModel> userLogin = UserController.loginValidate(username, password);

            if (userLogin != null && !userLogin.isEmpty()) {
                request.getSession().setAttribute("user", userLogin.get(0));
                response.sendRedirect(request.getContextPath() + "/UserProfileServlet");
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('Login Failed'); window.location.href='login.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace(); // better: log to a file or framework
            response.getWriter().println("<script>alert('Something went wrong. Please try again later.'); window.location.href='login.jsp';</script>");
        }

//        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
//        dispatcher.forward(request, response);
    }
}
