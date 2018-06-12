package com.ignacio;
import com.PGConnector;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import org.json.*;

@WebServlet("/ControlerServlet")
public class ControlerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        String products = request.getParameter("products");
        PGConnector pgdriver = new PGConnector("localhost", "gestionproductos");
        
        try {
            String queryString = "select webapi_product_create('" + products + "')";
            pgdriver.execute("ignacio", "1234", queryString);
           // processRequest(request, response);
            
        } catch (Exception e) {
			System.out.println("error:" + e);
        }
        response.sendRedirect("/productos/table.jsp");
    }
}
