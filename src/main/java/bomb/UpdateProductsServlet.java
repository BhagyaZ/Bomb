package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/UpdateProductsServlet")

public class UpdateProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String description = request.getParameter("description");

        boolean isTrue;
        isTrue=ProductController.updatedata(name, category, price, quantity, description);

        if (isTrue) {
            List<ProductModel> productdetails= ProductController.getById(id);
            request.setAttribute("productdetails", productdetails);
            String alertMessage = "Data updated successfully";
            response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='addproductform.jsp';</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }




}
}
