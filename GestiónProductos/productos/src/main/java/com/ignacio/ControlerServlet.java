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



	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Datos de la tabla productos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Funciona</h1>");
            out.println("<p>Datos de la tabla productos</p>");
            out.println("</body>");
            out.println("</html>");
            out.close();            
        } catch (Exception e) {
            System.out.println("error:" + e);
        }
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        String products = request.getParameter("products");
        PGConnector pgdriver = new PGConnector("localhost", "gestionproductos");
        
        try {
            String queryString = "select webapi_product_create('" + products + "')";
            pgdriver.execute("icalabrese", "7126", queryString);
            processRequest(request, response);
        } catch (Exception e) {
            System.out.println("error:" + e);
        }
        response.sendRedirect("/productos/table.jsp");
    }
}
