/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ss = request.getSession();
        if (ss.getAttribute("cart") == null)
            ss.setAttribute("cart", new HashMap<Integer, Integer>());
        String product = request.getParameter("product");
        if (product != null){
            int id = Integer.parseInt(product);
            HashMap<Integer, Integer> hash = (HashMap<Integer, Integer>)request
                    .getSession().getAttribute("cart");
            if (hash.get(id) == null)
                hash.put(id, 1);
            else
                hash.put(id, hash.get(id) + 1);
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
