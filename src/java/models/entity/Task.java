package models.entity;

/**
 *
 * @author Admin
 */
public class Task {

    private String taskname;
    private String taskDescription;
    private String timeLimit;
    private String memoryLimit;
    private String slug;
    private int score;

    public Task() {
    }

    public Task(
            String taskname,
            String taskDescription,
            String timeLimit,
            String memoryLimit,
            String slug,
            int score
    ) {
        this.taskname = taskname;
        this.taskDescription = taskDescription;
        this.timeLimit = timeLimit;
        this.memoryLimit = memoryLimit;
        this.slug = slug;
        this.score = score;
    }

    public String getTaskname() {
        return taskname;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public String getTimeLimit() {
        return timeLimit;
    }

    public String getMemoryLimit() {
        return memoryLimit;
    }

    public String getSlug() {
        return slug;
    }

    public int getScore() {
        return score;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public void setTimeLimit(String timeLimit) {
        this.timeLimit = timeLimit;
    }

    public void setMemoryLimit(String memoryLimit) {
        this.memoryLimit = memoryLimit;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
