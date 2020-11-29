package s264454.ru.ifmo.se;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        out.print("<b>X: " + req.getParameter("X") + " Y: " + req.getParameter("Y") + " R: " + req.getParameter("R") + " " + answer + "</b><br>");
    }

    private int check(HttpServletRequest req){
        try{
            int x = Integer.parseInt(req.getParameter("X"));
            int y = Integer.parseInt(req.getParameter("Y"));
            int r = Integer.parseInt(req.getParameter("R"));
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