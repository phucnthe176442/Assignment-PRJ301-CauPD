package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import utils.App;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserController", urlPatterns = {"/users?slug"})
public class UserController extends HttpServlet {
    
    // [GET] /homepage/users/showAll
    protected void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        String endPath = "/" + request.getParameter("slug");

        switch (endPath) {
            case "/create":
                createUser(request, response);
                break;
            case "/show":
                showUser(request, response);
                break;
            case "/showAll":
                showAllUser(request, response);
                break;
            case "/delete":
                deleteUser(request, response);
                break;
            case "/updateName":
                updateUsername(request, response);
                break;
            case "/updatePass":
                updatePassword(request, response);
                break;
        }
    }

    // [POST] /homepage/users/create
    protected void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // [GET] /homepage/users/show
    protected void showUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // [GET] /homepage/users/showAll
    protected void showAllUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("reached here");
        App.forward("users.jsp", request, response);
    }

    // [POST] /homepage/users/delete
    protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // [POST] /homepage/users/updateName
    protected void updateUsername(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // [POST] /homepage/users/updatePass
    protected void updatePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
