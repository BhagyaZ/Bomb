package bomb;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from form (make sure names match your form inputs)
        int reportID = Integer.parseInt(request.getParameter("reportID"));
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

        // Call update method
        boolean isSuccess = ReportControl.updatedata(reportID, reportMonth, generatedDate, inStock, soldItems, lowStock, soldOutItems, damaged, budget, refunds, targetSale, totalSale);

        // Redirect or forward based on result
        if (isSuccess) {

            String alertMessage = "Report updated successfully";
            response.getWriter().println("<script>alert('"+alertMessage+"')</script>");

            response.sendRedirect("viewreport.jsp");
        } else {
            response.sendRedirect("updatereport.jsp");
        }
    }
}
