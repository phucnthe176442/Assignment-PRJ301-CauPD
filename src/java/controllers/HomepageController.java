package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.SubmissionDAO;
import models.TaskDAO;
import models.entity.User;
import utils.App;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomepageController", urlPatterns = {"/homepage"})
public class HomepageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        index(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }

    private void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            boolean isAdmin = (boolean) session.getAttribute("isAdmin");
            User currentUser = (User) session.getAttribute("currentUser");
            request.setAttribute("currentUser", currentUser);
            request.setAttribute("isAdmin", isAdmin);

            SubmissionDAO submissionDAO = new SubmissionDAO();
            TaskDAO taskDAO = new TaskDAO();
            String submissionQuery = "select * from submissions";
            String taskQuery = "select * from tasks";
            if (!isAdmin) {
                submissionQuery = "select * from submissions where username = '" + currentUser.getUsername() + "'";
            }
            request.setAttribute(
                    "submissions",
                    submissionDAO.getSubmissions(submissionQuery)
            );
            request.setAttribute(
                    "tasks",
                    taskDAO.getTasks(taskQuery)
            );

            App.forward("homepage.jsp", request, response);
        }catch(Exception e) {
            response.sendRedirect("index.html");
        }
    }
}
