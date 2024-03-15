package dao;

import model.Comment;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
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

    public static ArrayList<Comment> getCommentListBySubjectId(int id){
        try(Connection c = openConnection()){
            String select = String.format("select comment.*, users.first_name, users.last_name\n" +
                    "from comment\n" +
                    "join users\n" +
                    "on comment.user_id = users.id\n" +
                    "where subject_id = %d\n" +
                    "order by id desc", id);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Comment> arr = new ArrayList<>();
            while (rs.next()){
                arr.add(new Comment(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("like_num"), rs.getString("content"), rs.getString("first_name"), rs.getString("last_name")));
            }
            return arr;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void addComment(String content, int subjectId, int userId){
        try(Connection c = openConnection()){
            String select = String.format("insert into comment (user_id, content, like_num, subject_id) values (%d, '%s', 0, %d)", userId, content, subjectId);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addMessage(User user, String content){
        try(Connection c = openConnection()){
            String select = String.format("insert into message value (null, %d, '%s')", user.getId(), content);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
