package bomb;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/InsertProductServlet")
public class InsertProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String category = request.getParameter("category");
        String price=request.getParameter("price");
        String quantity=request.getParameter("quantity");
        String description=request.getParameter("description");

        boolean isTrue;
        isTrue=ProductController.insertdata(name,category,price,quantity,description);

        if(isTrue==true){
            String alertMessage="Data inserted successfully";
            response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='addproductform.jsp';</script>");

        }
        else{
            RequestDispatcher dis2=request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}

