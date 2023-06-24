package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import models.SubmissionDAO;
import models.TaskDAO;
import models.UserDAO;
import models.entity.Submission;
import models.entity.Task;
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
        showHomepage(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void showHomepage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isAdmin = (boolean) request.getSession().getAttribute("isAdmin");
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        request.setAttribute("currentUser", currentUser);
        request.setAttribute("isAdminMode", isAdmin);

        SubmissionDAO submissionDAO = new SubmissionDAO();
        TaskDAO taskDAO = new TaskDAO();
        String submissionQuery = "select * from submissions";
        String taskQuery = "select * from tasks";
        if (!isAdmin) {
            submissionQuery = "select * from submissions where username = " + currentUser.getUsername();
            taskQuery = "select * from tasks where username = " + currentUser.getUsername();
        }
        request.setAttribute(
                "submissions",
                submissionDAO.getSubmissions(submissionQuery)
        );
        request.setAttribute(
                "tasks",
                taskDAO.getTasks(taskQuery)
        );

        App.redirect("homepage.jsp", request, response);
    }
}
