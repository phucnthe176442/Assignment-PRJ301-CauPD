package models;

import java.util.ArrayList;
import java.util.List;
import models.entity.Task;

/**
 *
 * @author Admin
 */
public class TaskDAO extends MyDAO {

    public List<Task> getTasks(String xSql) {
        List<Task> tasks = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Task task = new Task();
                task.setTaskname(rs.getString("taskname"));
                task.setTaskDescription(rs.getString("taskDescription"));
                task.setTimeLimit(rs.getString("timeLimit"));
                task.setMemoryLimit(rs.getString("memoryLimit"));
                task.setSlug(rs.getString("slug"));
                task.setScore(rs.getInt("score"));
                tasks.add(task);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
