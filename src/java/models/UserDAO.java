package models;

import java.util.ArrayList;
import java.util.List;
import models.entity.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO {

    public List<User> excuteQuery(String xSql) {
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

    public List<User> getAllUsers() {
        return excuteQuery("select * from users");
    }

    public List<User> getUserRanking() {
        return excuteQuery("select * from users order by score DESC");
    }
}
