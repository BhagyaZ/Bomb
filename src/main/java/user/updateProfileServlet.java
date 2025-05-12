package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Not used
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userID"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean isSuccess = UserController.updateProfile(id, name, email, phone);

        if (isSuccess) {
            List<UserModel> updatedUsers = UserController.getById(String.valueOf(id));
            if (!updatedUsers.isEmpty()) {
                UserModel updatedUser = updatedUsers.get(0);
                HttpSession session = request.getSession();
                session.setAttribute("user", updatedUser); // update session with new data
            }
            response.sendRedirect("userProfile.jsp");
        } else {
            response.sendRedirect("updateProfile.jsp?userID=" + id);
        }
    }
}
