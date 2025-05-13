package bomb;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/GetShippingByIdServlet")
public class GetShippingByIdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//        List<CustomerModel> shipping = CustomerController.getById(id);
//
//        request.setAttribute("allShipping", shipping); // same attribute as before
//        RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
//        dispatcher.forward(request, response);

        String productName = request.getParameter("productName");
        String productCode = request.getParameter("productCode");
        String productPrice = request.getParameter("productPrice");
        String quantity = request.getParameter("quantity");

        List<CustomerModel> shipping = CustomerController.getById(id);

        request.setAttribute("allShipping", shipping);

        // Pass these to the JSP
        request.setAttribute("productName", productName);
        request.setAttribute("productCode", productCode);
        request.setAttribute("productPrice", productPrice);
        request.setAttribute("quantity", quantity);

        RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

