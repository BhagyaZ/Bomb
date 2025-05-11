package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shippingId = Integer.parseInt(request.getParameter("shippingId"));
        String recipientName = request.getParameter("recipientName");
        String recipientAddress = request.getParameter("recipientAddress");
        String city = request.getParameter("city");
        int recipientContactNo = Integer.parseInt(request.getParameter("recipientContactNo"));
        int senderContactNo = Integer.parseInt(request.getParameter("senderContactNo"));
        String shippingMethod = request.getParameter("shippingMethod");
        String deliveryDate = request.getParameter("deliveryDate");
        String personalMsg = request.getParameter("personalMsg");
        String date = request.getParameter("date");

        boolean isTrue;
        isTrue = CustomerController.updatedata(shippingId,recipientName,recipientAddress,city,recipientContactNo,senderContactNo,shippingMethod,deliveryDate,personalMsg,date);

        if(isTrue){
            List<CustomerModel> customer = CustomerController.getById(String.valueOf(shippingId));

//            request.setAttribute("customer",customer);
            request.setAttribute("allShipping", customer);

            RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
            dispatcher.forward(request, response);
        }
        else{
            RequestDispatcher dis2 = request.getRequestDispatcher("Wrong.jsp");
            dis2.forward(request, response);
        }
    }

}
