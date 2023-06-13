package models;

import config.db.MyDAO;
import java.util.ArrayList;
import java.util.List;
import models.entity.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO {

    public User getUserByUsername(String xUsername) {
        User searchUser = new User();
        xSql = "select * from users where username = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xUsername);
            rs = ps.executeQuery();
            if (rs.next()) {
                searchUser.setUsername(rs.getString("username"));
                searchUser.setPassword(rs.getString("password"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return searchUser;
    }
}
