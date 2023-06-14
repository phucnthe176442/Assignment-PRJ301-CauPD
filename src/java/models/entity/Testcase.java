/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.entity;

/**
 *
 * @author Admin
 */
public class Testcase {

    private String taskname;
    private String input;
    private String output;

    public Testcase() {
    }

    public Testcase(String taskname, String input, String output) {
        this.taskname = taskname;
        this.input = input;
        this.output = output;
    }

    public String getTaskname() {
        return taskname;
    }

    public String getInput() {
        return input;
    }

    public String getOutput() {
        return output;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public void setOutput(String output) {
        this.output = output;
    }

}
