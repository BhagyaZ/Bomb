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
        String recipientName = request.getParameter("recipientName");
        String recipientAddress = request.getParameter("recipientAddress");
        String city = request.getParameter("city");
        int recipientContactNo = Integer.parseInt(request.getParameter("recipientContactNo"));
        int senderContactNo = Integer.parseInt(request.getParameter("senderContactNo"));
        String shippingMethod = request.getParameter("shippingMethod");
        String deliveryDate = request.getParameter("deliveryDate");
        String personalMsg = request.getParameter("personalMsg");

//        boolean isTrue = CustomerController.insertdata(recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg);
        int shippingId = CustomerController.insertdata(recipientName, recipientAddress, city, recipientContactNo, senderContactNo, shippingMethod, deliveryDate, personalMsg);


        if (shippingId != -1) {
            // redirect to servlet with shippingId
            response.sendRedirect("GetShippingByIdServlet?id=" + shippingId);

//        if (isTrue) {
//            String alertMessage = "Data insert Successful";
//            response.getWriter().println("<script> alert('" + alertMessage + "');window.location.href = 'reviewshippingdetails.jsp'</script>");
//>>>>>>> d2076dfa6e1c74dc4893bc6a603fa0acdd8c1e3e
        } else {
            request.setAttribute("error", "Insertion failed.");
            RequestDispatcher dis2 = request.getRequestDispatcher("shippingdetails.jsp");
            dis2.forward(request, response);
        }
    }

}
