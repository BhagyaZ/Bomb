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

package bomb;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetALLShippingDetailsServlet")
public class GetALLShippingDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        List<CustomerModel> allShipping = CustomerController.getAll();
        request.setAttribute("allShipping", allShipping);

        RequestDispatcher dispatcher = request.getRequestDispatcher("reviewshippingdetails.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }

}