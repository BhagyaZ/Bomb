package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteShippingServlet")
public class  DeleteShippingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String shippingId = request.getParameter("shippingId");
        boolean isTrue;
        isTrue = CustomerController.deletedata(shippingId);
        if (isTrue == true) {
            String alertMessage = "Order Deleted Successful";
            response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='OrderReviewServlet';</script>");

        }
        else{
            List<CustomerModel> cusdetails = CustomerController.getById(shippingId);
            request.setAttribute("cusdetails", cusdetails);

            RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
            dispacher.forward(request, response);

        }
    }
}
