package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/DeleteProductServlet")

public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean isTrue;

        // Fix: pass id as a String
        isTrue = ProductController.deletedata(String.valueOf(id));

        if (isTrue) {
            String alertMessage = "Product deleted successfully";
            request.setAttribute("alertMessage", alertMessage);

            response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='ProductDetails.jsp';</script>");


            RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDetails.jsp");
            dispatcher.forward(request, response);

        } else {
            List<ProductModel> ProductDetails = ProductController.getById(String.valueOf(id));
            request.setAttribute("ProductDetails", ProductDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDetails.jsp");
            dispatcher.forward(request, response);
        }
    }

}
