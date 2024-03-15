package dao;

import model.Comment;
import model.Semester;
import model.Subject;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
    public static Connection openConnection() {
        Connection conn = null;
        try {
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.username, DBConfig.password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static ArrayList<Subject> getProductList(String order, int page) {
        try (Connection c = openConnection()) {
            int pageSize = 5;
            int start = (page-1)*pageSize;
            String select = String.format("SELECT *\n" +
                    "FROM subject\n" +
                    "JOIN semester ON subject.semester_id = semester.id\n" +
                    "LIMIT %d OFFSET %d;", pageSize, start);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Subject> arr = new ArrayList<>();
            while (rs.next()){
                Semester semester = new Semester(rs.getInt("semester_id"), rs.getString("name"));
                arr.add(new Subject(rs.getInt("id"), semester, rs.getInt("view_count"),rs.getString("title"), rs.getString("description"), rs.getInt("price"), rs.getInt("compare_at_price")));
            }
            return arr;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    //cai nay de an vao xem trang chi tiet
    public static Subject getSubjectById(int id){
        try (Connection c = openConnection()) {
            String select = String.format("select * from subject where id = %d", id);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                Subject subject = new Subject(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("drive_url"), rs.getString("picture_url"),rs.getInt("price"), rs.getInt("compare_at_price"));
                ArrayList<Comment> cmt = CommentDAO.getCommentListBySubjectId(subject.getId());
                subject.setCommentList(cmt);
                return subject;
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    //cai nay de lay danh sach theo ky, se duoc sua de gop chung voi tren
    public static ArrayList<Subject> getSubjectBySemester(int id, int page){
        int pageSize = 8;
        int start = (page-1)*pageSize;
        try (Connection c = openConnection()) {
            String select = String.format("select * from subject where semester_id = %d limit %d offset %d", id, pageSize, start);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();


            ArrayList<Subject> arr = new ArrayList<>();
            while (rs.next()){
                arr.add(new Subject(rs.getInt("id"), rs.getInt("view_count") ,rs.getString("title"), rs.getString("description"), rs.getInt("price"), rs.getInt("compare_at_price")));
            }
            return arr;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void increaseView(int id){
        try(Connection c = openConnection()){
            String select = String.format("UPDATE subject\n" +
                    "SET view_count = view_count + 1\n" +
                    "WHERE id = %d;", id);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //dem tong so luong cac mon
    public static int countSubject(){
        try (Connection c = openConnection()) {
            String select = String.format("select (count(title)) as count from subject");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return rs.getInt("count");
            }
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }
    // goi giao vien
    public static ArrayList<String> getFavTeacher(int id){
        try (Connection c = openConnection()) {
            String select = String.format("select * from favteacher where id = %d", id);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> favTeacher = new ArrayList<>();
            if (rs.next()){
                favTeacher.add(rs.getString("teacher1"));
                favTeacher.add(rs.getString("teacher2"));
                favTeacher.add(rs.getString("teacher3"));
            }
            return favTeacher;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static ArrayList<Subject> getSearch(String search) {
        try (Connection c = openConnection()) {
            String select = String.format("SELECT * FROM test_linh.subject WHERE title LIKE '%%%s%%';", search);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Subject> arr = new ArrayList<>();
            while (rs.next()){
                arr.add(new Subject(rs.getInt("id"),rs.getInt("view_count"),rs.getString("title"), rs.getString("description"), rs.getInt("price"), rs.getInt("compare_at_price")));
            }
            return arr;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
