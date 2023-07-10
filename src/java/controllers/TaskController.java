package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.BorderLayout;
import models.TaskDAO;
import models.entity.Task;
import utils.App;

/**
 *
 * @author Admin
 */
@WebServlet(name = "TaskController", urlPatterns = {"/tasks/*"})
public class TaskController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] paths = request.getRequestURL().toString().split("/");
        if (paths[4].equals("submit")) {
            this.submit();
            return;
        }
        
        this.index(paths[4], request, response);
    }

    private void submit() {

    }

    private void index(
            String slug,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        TaskDAO taskDAO = new TaskDAO();
        String taskQuery = "select * from tasks where slug = '" + slug + "'";
        try {
            Task task = taskDAO.getTasks(taskQuery).get(0);
            request.setAttribute("task", task);
            response.sendRedirect("/tasks/show");
        } catch (Exception e) {
            response.sendRedirect("../index.html");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
