//package bomb;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/GetALLShippingDetailsServlet")
//public class GetALLShippingDetailsServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        List<CustomerModel> allShipping = CustomerController.getAllShippingDetails();
//        request.setAttribute("allShipping", allShipping);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
//        dispatcher.forward(request, response);
//    }
//}