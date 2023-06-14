/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import config.db.MyDAO;
import java.util.ArrayList;
import java.util.List;
import models.entity.Task;

/**
 *
 * @author Admin
 */
public class TaskDAO extends MyDAO {

    private Task getTaskFromDB() {
        Task task = new Task();
        try {
            task.setTaskname(rs.getString("taskname"));
            task.setTaskDescription(rs.getString("taskDescription"));
            task.setTimeLimit(rs.getString("timeLimit"));
            task.setMemoryLimit(rs.getString("memoryLimit"));
            task.setSlug(rs.getString("slug"));
            task.setScore(rs.getInt("score"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return task;
    }

    public List<Task> getTasks() {
        List<Task> tasks = new ArrayList<>();
        xSql = "select * from submissions";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(getTaskFromDB());
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
