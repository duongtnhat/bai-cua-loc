
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Model;

public class CreateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("user");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String sql = "insert into sc_product(name, image, price) values (N'%s', N'%s', %s)";
        sql = String.format(sql, name, image, price);
        Model.DBConnection();
        try {
            long rs = Model.insert(sql);
        } catch (Exception ex) {
            Logger.getLogger(CreateProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("./product");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
