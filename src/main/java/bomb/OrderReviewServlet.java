package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/OrderReviewServlet")
public class OrderReviewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerController controller = new CustomerController();
        List<CustomerModel> orders = controller.getAllCustomerOrders(); // changed method name

        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("orderreview.jsp");
        dispatcher.forward(request, response);
    }
}

