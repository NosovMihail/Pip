package s264454.ru.ifmo.se;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
            try{
                if((req.getParameter("X") != null)&&(req.getParameter("Y" )!= null)&&(req.getParameter("R") != null)){
                    req.getRequestDispatcher("AreaCheck").forward(req, resp);
                } else {
                    req.getRequestDispatcher("page.jsp").forward(req, resp);
                }
            }catch(NullPointerException e){
                req.getRequestDispatcher("page.jsp").forward(req, resp);
            }
    }

}