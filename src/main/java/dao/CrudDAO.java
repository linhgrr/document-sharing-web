package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CrudDAO {
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

    public static void addSubject(String title, String advice, int semester, String picLink, String recTeacher1, String recTeacher2, String recTeacher3, String midterm, String finalExam, String relate){
        try(Connection conn = openConnection()){
            String sql1 = "INSERT INTO subject VALUES (null, ?, ?, ?, 0, 0, null, ?, 0)";
            String sql2 = "INSERT INTO link VALUES (null, ?, ?, ?)";
            String sql3 = "INSERT INTO favteacher VALUES (null, ?, ?, ?)";

            conn.setAutoCommit(false);

            PreparedStatement pstmt1 = conn.prepareStatement(sql1);
            pstmt1.setInt(1, semester);
            pstmt1.setString(2, title);
            pstmt1.setString(3, advice);
            pstmt1.setString(4, picLink);
            pstmt1.executeUpdate();

            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setString(1, midterm);
            pstmt2.setString(2, finalExam);
            pstmt2.setString(3, relate);
            pstmt2.executeUpdate();

            PreparedStatement pstmt3 = conn.prepareStatement(sql3);
            pstmt3.setString(1, recTeacher1);
            pstmt3.setString(2, recTeacher2);
            pstmt3.setString(3, recTeacher3);
            pstmt3.executeUpdate();

            conn.commit();

            pstmt1.close();
            pstmt2.close();
            pstmt3.close();
            conn.setAutoCommit(true);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
