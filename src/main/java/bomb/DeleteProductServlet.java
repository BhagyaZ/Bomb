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
            // You can redirect or forward as needed
            response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='viewallproducts.jsp';</script>");
        } else {
            List<ProductModel> productDetails = ProductController.getById(String.valueOf(id));
            request.setAttribute("productDetails", productDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("productdetails.jsp");
            dispatcher.forward(request, response);
        }
    }

}
