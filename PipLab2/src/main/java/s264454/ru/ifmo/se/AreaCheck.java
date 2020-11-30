package s264454.ru.ifmo.se;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AreaCheck  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession ses =req.getSession();
        int count;
        try {
            if ((Integer) (ses.getAttribute("count")) > 0) {
                count = (Integer) ses.getAttribute("count");
            } else {
                count = 0;
            }
        }catch(NullPointerException e){
            count = 0;
        }
        ses.setAttribute("X"+count,req.getParameter("X"));
        ses.setAttribute("Y"+count,req.getParameter("Y"));
        ses.setAttribute("R"+count,req.getParameter("R"));
        int a = check(req);
        String answer = "";
        if(a == 0){
            answer = "No";
        }
        if(a == 1){
            answer = "Yes";
        }
        if(a == 2){
            answer = "Well done. Here come the test results: You are a horrible person. I'm serious, that's what it says: A horrible person. We weren't even testing for that.";
        }
        ses.setAttribute("A"+count, answer);
        ses.setAttribute("count", count+1);
        for(int i = 0; i <= count; i++) {
            System.out.println(i);
            out.print("<b>X: " + ses.getAttribute("X"+i) + " Y: " + ses.getAttribute("Y"+i) + " R: " + ses.getAttribute("R"+i) + " " + ses.getAttribute("A"+i) + "</b><br>");
        }
    }

    private int check(HttpServletRequest req){
        try{
            double x = Double.parseDouble(req.getParameter("X"));
            double y = Double.parseDouble(req.getParameter("Y"));
            double r = Double.parseDouble(req.getParameter("R"));
            if(x > 0){
                if(y < 0){
                    return 0;
                }else{
                    if(x+y <= r/2){
                        return 1;
                    } else {
                        return 0;
                    }
                }
            } else {
                if(y < 0){
                    if(x*x + y*y <= r*r){
                        return 1;
                    } else {
                        return 0;
                    }
                } else {
                    if((x >= -1*r)&&(y <= r/2)){
                        return 1;
                    } else {
                        return 0;
                    }
                }
            }
        }catch (NumberFormatException e){
            return 2;
        }
    }

}