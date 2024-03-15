package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import dao.UserDAO;
import dao.DBConfig;


@WebServlet(name = "ProcessLogin", value = "/login")
public class ProcessLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //xu ly truong hop da dang nhap nma cu thich dang nhap tiep de co ng thu 3
        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("user");
        if (userInfo != null){
            response.sendRedirect("/demo2_war_exploded/home");
        }else {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //xu ly truong hop da dang nhap nma cu thich dang nhap tiep de co ng thu 3
        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("user");
        if (userInfo != null){
            response.sendRedirect("/demo2_war_exploded/home");
        }

        User user = UserDAO.trySignin(username, password);
        if (user != null){
            session.setAttribute("user", user);
            response.sendRedirect("/demo2_war_exploded/home");
        }else{
            request.setAttribute("message", "Login failed!");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}