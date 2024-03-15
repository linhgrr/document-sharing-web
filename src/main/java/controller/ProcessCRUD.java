package controller;

import dao.CrudDAO;
import dao.ProductDAO;
import model.Subject;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ProcessCRUD", value = "/admin")
public class ProcessCRUD extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !user.getUsername().equals("admin")){
            response.sendRedirect("/demo2_war_exploded");
        }else {
            //get tat ca tham so
            int pageNum;
            String pageStr = request.getParameter("page-num");
            int countSubject = ProductDAO.countSubject();

            try{
                pageNum = Integer.parseInt(pageStr);
            }catch (Exception e){
                pageNum = 1;
            }

            ArrayList<Subject> subjects = ProductDAO.getProductList(null, pageNum);

            request.setAttribute("countSub", countSubject);
            request.setAttribute("subjectList", subjects);

            RequestDispatcher dis = request.getRequestDispatcher("crud.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action.equals("add")) {
            String title = request.getParameter("title");
            String advice = request.getParameter("advice");
            int semester;
            try {
                semester = Integer.parseInt(request.getParameter("semester"));
            } catch (Exception e) {
                semester = 0;
            }
            String picLink = request.getParameter("pic");
            String recTeacher1 = request.getParameter("fav-teacher1");
            String recTeacher2 = request.getParameter("fav-teacher2");
            String recTeacher3 = request.getParameter("fav-teacher3");
            String midterm = request.getParameter("midterm");
            String finalExam = request.getParameter("final");
            String relate = request.getParameter("relate");

            System.out.println("dada");
            System.out.println(semester);
            System.out.println(title);
            System.out.println(advice);
            System.out.println(picLink);
            System.out.println("\n");
            System.out.println(midterm);
            System.out.println(finalExam);
            System.out.println(relate);
            System.out.println("\n");
            System.out.println(recTeacher1);
            System.out.println(recTeacher2);
            System.out.println(recTeacher3);
            CrudDAO.addSubject(title, advice, semester, picLink, recTeacher1, recTeacher2, recTeacher3, midterm, finalExam, relate);
            response.sendRedirect("/demo2_war_exploded/admin");
        }
    }
}