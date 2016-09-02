import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Confirm", urlPatterns = {"/Confirm"})
public class Confirm extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uniqueId = request.getParameter("id");
        // Lookup variable `uniqueId` in a database to find messageSid
        String messageSid = "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        
        // TODO: Implement
    }
}