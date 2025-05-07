package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class  GetAllProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductModel> allProducts = ProductController.getAll();
        request.setAttribute("allProducts", allProducts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDetails.jsp");
        dispatcher.forward(request, response);
    }
}
