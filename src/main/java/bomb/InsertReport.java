package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

@WebServlet("/InsertReport")
public class InsertReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        boolean isTrue;

        isTrue = ReportControl.insertdata(reportMonth, generatedDate, inStock, soldItems, lowStock, soldOutItems, damaged, budget, refunds, targetSale, totalSale);

        if (isTrue == true) {
            String alertmessage = "Report successfully inserted into the database";
            response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='monthlyreport.jsp'</script>");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("generatereport.jsp");
            rd.forward(request, response);
        }
    }
}
