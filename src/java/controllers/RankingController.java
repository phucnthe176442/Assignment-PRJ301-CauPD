package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import models.UserDAO;
import models.entity.User;
import utils.App;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RankingController", urlPatterns = {"/ranking"})
public class RankingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        index(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = new ArrayList<User>();
        UserDAO userDAO = new UserDAO();
        users = userDAO.getUserRanking();
        System.out.println("Size users list: " + users.size());
        request.setAttribute("users", users);

        App.redirect("ranking.jsp", request, response);
    }

}
