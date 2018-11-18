package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Model;

@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        try {
            Model.DBConnection();
            String sql = String.format("insert into sc_bill(address, phone) values (N'%s', '%s')",
                    address, phone);
            long id = Model.insert(sql);
            HashMap<Integer, Integer> hash = (HashMap<Integer, Integer>) request
                    .getSession().getAttribute("cart");
            for (Map.Entry<Integer, Integer> entry : hash.entrySet()) {
                Integer product = entry.getKey();
                Integer quantity = entry.getValue();
                sql = String.format("insert into sc_bill_detail(bid, pid, quatity) values (%d, %d, %d);",
                    id, product, quantity);
                Model.insert(sql);
            }            
            hash.clear();
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
