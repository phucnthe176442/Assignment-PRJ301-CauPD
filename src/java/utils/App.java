package utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class App {

    public static void forward(
            String filePath,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        request.setAttribute("filePath", filePath);
        request.getRequestDispatcher("views/index.jsp").forward(request, response);
    }
    
    public static void include(
            String filePath,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        request.setAttribute("filePath", filePath);
        request.getRequestDispatcher("views/index.jsp").include(request, response);
    }

}
