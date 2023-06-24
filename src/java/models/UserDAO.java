package models;

import java.util.ArrayList;
import java.util.List;
import models.entity.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO {

    public List<User> getUsers(String xSql) {
        List<User> users = new ArrayList<User>();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setScore(Integer.parseInt(rs.getString("score")));
                users.add(user);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public User getUserByUsername(String xUsername) {
        User user = new User();
        xSql = "select * from users where username = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xUsername);
            rs = ps.executeQuery();
            if (rs.next()) {
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getUserRanking() {
        List<User> users = new ArrayList<User>();
        xSql = "select * from users order by score DESC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setScore(Integer.parseInt(rs.getString("score")));
                users.add(user);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
}
