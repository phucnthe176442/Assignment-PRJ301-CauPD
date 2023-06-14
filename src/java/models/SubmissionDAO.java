package models;

import config.db.MyDAO;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import models.entity.Submission;

/**
 *
 * @author Admin
 */
public class SubmissionDAO extends MyDAO {

    private Submission getSubmissionFromDB() {
        Submission submission = new Submission();
        try {
            submission.setUsername(rs.getString("username"));
            submission.setTaskname(rs.getString("taskname"));
            submission.setStatus(rs.getString("status"));
            submission.setWhen(rs.getString("date"));
            submission.setSlug(rs.getString("slug"));
            submission.setCode(rs.getString("code"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submission;
    }

    public List<Submission> getSubmissions() {
        List<Submission> submissions = new ArrayList<>();
        xSql = "select * from submissions";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                submissions.add(getSubmissionFromDB());
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submissions;
    }

    public List<Submission> getSubmissionsByUsernam(String xUsername) {
        List<Submission> submissions = new ArrayList<>();
        xSql = "select * from submissions where username = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, xUsername);
            rs = ps.executeQuery();
            while (rs.next()) {
                submissions.add(getSubmissionFromDB());
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submissions;
    }
}
