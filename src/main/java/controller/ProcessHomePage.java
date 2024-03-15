package controller;

import dao.ProductDAO;
import dao.SemesterDAO;
import model.Semester;
import model.Subject;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ProcessHomePage", value = "/home")
public class ProcessHomePage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String pageStr = request.getParameter("page-num");
        int countSubject = ProductDAO.countSubject();
        String search = request.getParameter("search");

         int pageNum;
         try {
             pageNum = Integer.parseInt(pageStr);
         }catch (Exception e){
             pageNum  = 1;
         }

        ArrayList<Subject> subjectList = ProductDAO.getProductList(null, pageNum);
        ArrayList<Semester> semesterList = SemesterDAO.getSemesterList();
        //lay semester-id tu url, sau do thuc hien ham lay danh sach neu khac null kk
        String semester_id = request.getParameter("semester-id");
        if (semester_id != null){
            subjectList = ProductDAO.getSubjectBySemester(Integer.parseInt(semester_id), pageNum);
        }

        if (search != null){
            subjectList = ProductDAO.getSearch(search);
        }

        request.setAttribute("countSub", countSubject);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("semesterList", semesterList);

        RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}