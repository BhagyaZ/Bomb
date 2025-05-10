package bomb;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/GetALLShippingDetailsServlet")
public class GetALLShippingDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<CustomerModel> allReports = CustomerController.getAllShippingDetails();
            System.out.println("Retrieved " + allReports.size() + " records"); // Debug line
            request.setAttribute("allReports", allReports);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving shipping details: " + e.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
