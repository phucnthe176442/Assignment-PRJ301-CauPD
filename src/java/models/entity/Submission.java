package models.entity;

/**
 *
 * @author Admin
 */
public class Submission {

    private String username;
    private String taskname;
    private String status;
    private String when;
    private String slug;
    private String code;

    public Submission() {
    }

    public Submission(
            String username,
            String taskname,
            String status,
            String when,
            String slug,
            String code
    ) {
        this.username = username;
        this.taskname = taskname;
        this.status = status;
        this.when = when;
        this.slug = slug;
        this.code = code;
    }

    public String getUsername() {
        return username;
    }

    public String getTaskname() {
        return taskname;
    }

    public String getStatus() {
        return status;
    }

    public String getWhen() {
        return when;
    }

    public String getSlug() {
        return slug;
    }

    public String getCode() {
        return code;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setWhen(String when) {
        this.when = when;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
