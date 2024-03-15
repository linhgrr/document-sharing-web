package controller;

import dao.CommentDAO;
import dao.ProductDAO;
import model.Comment;
import model.Subject;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ProcessSubjectDetail", value = "/subject-detail")
public class ProcessSubjectDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        Subject subject = ProductDAO.getSubjectById(Integer.parseInt(id));
        ArrayList<Comment> commentList = CommentDAO.getCommentListBySubjectId(Integer.parseInt(id));
        ArrayList<String> favTeacher = ProductDAO.getFavTeacher(Integer.parseInt(id));
        ProductDAO.increaseView(Integer.parseInt(id));

        if(subject != null){
            request.setAttribute("favTeacher", favTeacher);
            request.setAttribute("subject", subject);
            request.setAttribute("commentList", commentList);
            RequestDispatcher dis = request.getRequestDispatcher("subject-detail.jsp");
            dis.forward(request, response);
        }else{
//nhay vao trang 404 a kk
            RequestDispatcher dis = request.getRequestDispatcher("404.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String subjectId = request.getParameter("id");
        String comment = request.getParameter("comment");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            CommentDAO.addComment(comment, Integer.parseInt(subjectId), user.getId());

            response.sendRedirect("./subject-detail?id="+subjectId);
        } else{
            RequestDispatcher dis  = request.getRequestDispatcher("404.jsp");
            dis.forward(request, response);
        }

    }
}