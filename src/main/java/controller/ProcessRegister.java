package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "ProcessRegister", value = "/register")
public class ProcessRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");

        User newUser = new User(username, password, firstName, lastName, gender, dob);
        String message = "";
        boolean valid = true;
        if (!password.equals(confirmPassword)){
            message = "Mat khau khong trung khop";
            valid = false;
        }else if (UserDAO.isExistUser(username)){
            message = "Tai khoan da ton tai";
            valid = false;
        }else if (!UserDAO.crateUser(newUser)){
            message = "Server loi kk";
            valid = false;
        }
        if (!valid){
            request.setAttribute("messageR", message);
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
        }else{
            RequestDispatcher dis = request.getRequestDispatcher("waiting.jsp");
            dis.forward(request, response);
        }

    }
}