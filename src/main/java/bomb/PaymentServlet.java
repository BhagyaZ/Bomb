package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account_number = request.getParameter("account_number");
        String card_type = request.getParameter("card_type");
        String expirydate = request.getParameter("expirydate");
        String cvv = request.getParameter("cvv");
        String pin = request.getParameter("pin");
        String security_pin = request.getParameter("security_pin");

        try {
            boolean isValid = CustomerController.paymentValidation(account_number, card_type, expirydate, cvv, pin, security_pin);

            if (isValid) {

                // Redirect to Order Review page
                response.sendRedirect("OrderReviewServlet");
                return;

            } else {
                request.setAttribute("message", "❌ Invalid payment details. Please check and try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "⚠️ An error occurred while validating payment.");
        }

        RequestDispatcher dis = request.getRequestDispatcher("customerpayment.jsp");
        dis.forward(request, response);
    }
}
