package dao;

import model.User;

import java.sql.*;

public class UserDAO {
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

    public static User trySignin(String username, String password) {
        try (Connection c = openConnection()) {
            String select = String.format("select * from users where username = '%s' and password = '%s'", username, password);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("gender"), rs.getString("birthday"));
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static boolean isExistUser(String username){
        try (Connection c = openConnection()){
            String select = String.format("select * from users where username = '%s'", username);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static boolean crateUser(User user){
        try (Connection c = openConnection()){
            String select = String.format(String.format("INSERT INTO users (username, password, first_name, last_name, gender, birthday) " +
                    "VALUES" +
                    " ('%s', '%s', '%s', '%s', '%s', '%s');",  user.getUsername(), user.getPassword(), user.getFirstname(), user.getLastname(), user.getGender(), user.getBirthday()));
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}