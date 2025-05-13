package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CustomerInsertServlet")
public class CustomerInsertServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get product-related data
        String productName = request.getParameter("productName");
        String productCode = request.getParameter("productCode");
        String productPrice = request.getParameter("productPrice");
        String quantity = request.getParameter("quantity");


        String recipientName = request.getParameter("recipientName");
        String recipientAddress = request.getParameter("recipientAddress");
        String city = request.getParameter("city");
        int recipientContactNo = Integer.parseInt(request.getParameter("recipientContactNo"));
        int senderContactNo = Integer.parseInt(request.getParameter("senderContactNo"));
        String shippingMethod = request.getParameter("shippingMethod");
        String deliveryDate = request.getParameter("deliveryDate");
        String personalMsg = request.getParameter("personalMsg");

        int shippingId = CustomerController.insertdata(recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg);


        if (shippingId != -1) {
            // redirect to servlet with shippingId
            // response.sendRedirect("GetShippingByIdServlet?id=" + shippingId);

            response.sendRedirect("GetShippingByIdServlet?id=" + shippingId +
                    "&productName=" + java.net.URLEncoder.encode(productName, "UTF-8") +
                    "&productCode=" + java.net.URLEncoder.encode(productCode, "UTF-8") +
                    "&productPrice=" + productPrice +
                    "&quantity=" + quantity);



        } else {
            request.setAttribute("error", "Insertion failed.");
            RequestDispatcher dis2 = request.getRequestDispatcher("shippingdetails.jsp");
            dis2.forward(request, response);
        }
    }

}