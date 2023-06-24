package models;

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

    public List<Submission> getSubmissions(String xSql) {
        List<Submission> submissions = new ArrayList<>();

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Submission submission = new Submission();
                submission.setUsername(rs.getString("username"));
                submission.setTaskname(rs.getString("taskname"));
                submission.setStatus(rs.getString("status"));
                submission.setWhen(rs.getString("date"));
                submission.setSlug(rs.getString("slug"));
                submission.setCode(rs.getString("code"));
                submissions.add(submission);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submissions;
    }
}
