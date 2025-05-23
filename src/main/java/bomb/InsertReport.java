package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/InsertReport")
public class InsertReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String reportMonth = request.getParameter("reportMonth");
        String generatedDate = request.getParameter("generatedDate");
        int inStock = Integer.parseInt(request.getParameter("inStock"));
        int soldItems = Integer.parseInt(request.getParameter("soldItems"));
        int lowStock = Integer.parseInt(request.getParameter("lowStock"));
        String soldOutItems = request.getParameter("soldOutItems");
        int damaged = Integer.parseInt(request.getParameter("damaged"));
        double budget = Double.parseDouble(request.getParameter("budget"));
        double refunds = Double.parseDouble(request.getParameter("refunds"));
        double targetSale = Double.parseDouble(request.getParameter("targetSale"));
        double totalSale = Double.parseDouble(request.getParameter("totalSale"));

        boolean isInserted = ReportControl.insertdata(
                reportMonth, generatedDate, inStock, soldItems, lowStock,
                soldOutItems, damaged, budget, refunds, targetSale, totalSale
        );

        if (isInserted) {
            // Show success alert and redirect
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Report successfully inserted into the database');"
                    + "window.location.href='monthlyreport.jsp';</script>");
        } else {
            // Redirect back to form page if insertion fails
            RequestDispatcher dispatcher = request.getRequestDispatcher("generatereport.jsp");
            dispatcher.forward(request, response);
        }
    }
}
