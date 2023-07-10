
package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.UserDAO;
import models.entity.User;
import utils.App;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isLoginValid(request)) {
            response.sendRedirect("/homepage");
            return;
        }
        
        App.forward("loginFail.jsp", request, response);
    }

    protected boolean isLoginValid(HttpServletRequest request)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        String userQuery = "select * from users where username = '" + username + "'";
        List<User> users = userDAO.excuteQuery(userQuery);
        if ((int) users.size() == 0) {
            return false;
        }
        User xUser = users.get(0);

        boolean isLoginValid = xUser.getPassword().equals(password);
        if (!isLoginValid) {
            return false;
        }

        HttpSession session = request.getSession();
        session.setAttribute("currentUser", xUser);
        boolean isAdmin = false;
        if (username.equals("admin")) {
            isAdmin = true;
        }
        session.setAttribute("isAdmin", isAdmin);
        return true;
    }

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        App.forward("login.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
