package bomb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteReport")
public class DeleteReport extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        boolean isTrue;

        isTrue = ReportControl.deletedata(id);

        if (isTrue == true) {
//            String alertMessage = "Report deleted successfully";
            response.getWriter().println("<script>window.location.href='monthlyreport.jsp';</script>");

        } else {
            List<ReportModel> reportDetails = ReportControl.getById(id);
            request.setAttribute("reportDetails", reportDetails);

            RequestDispatcher rd = request.getRequestDispatcher("viewreport.jsp");
            rd.forward(request, response);
        }
    }
}
