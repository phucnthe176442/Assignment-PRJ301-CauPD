package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.SubmissionDAO;
import models.TaskDAO;
import models.UserDAO;
import models.entity.Submission;
import models.entity.Task;
import models.entity.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomepageController", urlPatterns = {"/homepage"})
public class HomepageController extends HttpServlet {

    private User currentUser;
    private boolean isAdminMode = false;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        showHomepage(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (checkLogin(request)) {
            showHomepage(request, response);
        } else {
            request.getRequestDispatcher("views/loginFail.jsp").forward(request, response);
        }
    }

    protected boolean checkLogin(HttpServletRequest request)
            throws ServletException, IOException {
        this.currentUser = null;
        this.isAdminMode = false;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User xUser = userDAO.getUserByUsername(username);

        boolean isValidLogin = xUser != null && xUser.getPassword().equals(password);
        if (!isValidLogin) {
            return false;
        }

        this.currentUser = xUser;
        if (username.equals("admin")) {
            this.isAdminMode = true;
        }
        return true;
    }

    private void showHomepage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("currentUser", this.currentUser);
        request.setAttribute("isAdminMode", this.isAdminMode);

        request.setAttribute("submissions", this.getSubmissions());
        request.setAttribute("tasks", this.getTasks());

        request.setAttribute("filePath", "./homepage.jsp");
        request.getRequestDispatcher("views/main.jsp").forward(request, response);
    }

    private List<Submission> getSubmissions() {
        SubmissionDAO submissionDAO = new SubmissionDAO();

        if (this.isAdminMode) {
            return submissionDAO.getSubmissions();
        }

        return submissionDAO.getSubmissionsByUsernam(this.currentUser.getUsername());
    }

    private List<Task> getTasks() {
        TaskDAO taskDAO = new TaskDAO();

        return taskDAO.getTasks();
    }

}
