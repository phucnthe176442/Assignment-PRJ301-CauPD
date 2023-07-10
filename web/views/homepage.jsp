<%-- 
    Document   : homepage
    Created on : Jun 13, 2023, 11:46:17 PM
    Author     : Admin
--%>


<%@page import = "models.entity.Submission"%>
<%@page import = "models.entity.Task"%>
<%@page import = "java.text.DateFormat"%>  
<%@page import = "java.text.SimpleDateFormat"%>  
<%@page import = "java.util.*"%>
<%
    boolean isAdmin =  (boolean) request.getAttribute("isAdmin");
    List<Submission> submissions = (List<Submission>) request.getAttribute("submissions");
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
%>


<div class="content-homepage">
    <div class="content-homepage_small">

        <div class="task-table task-table_small">
            <h1> Problem Set </h1>
            <table class="table home_problem_list">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Task Name</th>
                        <th scope="col">Score</th>
                            <%  if(isAdmin) { %>
                        <th scope="col">Test</th>
                        <th scope="col">Del</th>
                            <% } %>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int index = 1;
                    for(Task task: tasks) { 
                    %>
                    <tr class="problem_item">
                        <td><%= index %></td>
                        <td><a href="/tasks/<%= task.getSlug() %>"><%= task.getTaskname() %></a></td>
                        <td><%= task.getScore() %></td>
                        <% if(isAdmin) { %>
                        <td>icon add</td>
                        <td>icon del</td>
                        <% } %>
                    </tr>
                    <%
                        index++;
                        } 
                    %>
                </tbody>
            </table>
            <%  if(isAdmin) { %>
            <div class="userFunction userFunction_small mt-4">
                <a href="tasks/showCreate">
                    <button class="mt-3">Add Task</button>
                </a>
                <a href="users/showAll">
                    <button class="mt-3">Show Users</button>
                </a>
            </div>
            <% } %>
        </div>
    </div>
    <div class="submission-table">
        <h1>Submissions</h1>
        <table class="table home_submission_list">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">When</th>
                        <%  if(isAdmin) { %>
                    <th scope="col">User Name</th>
                        <% } %>
                    <th scope="col">Task</th>
                    <th scope="col">Status</th>
                    <th scope="col">View</th>
                </tr>
            </thead>
            <tbody>
                <%
                    index = (int) submissions.size();
                    for(Submission submission: submissions) { 
                %>
                <tr class="submission_item">
                    <td><%= index %></td>
                    <td><%= submission.getWhen() %></td>
                    <% if(isAdmin) { %>
                    <td><%= submission.getUsername() %></td>
                    <% } %>
                    <td><%= submission.getTaskname() %></td>
                    <td><%= submission.getStatus() %></td>
                    <td><a>icon eye</a></td>
                </tr>
                <%
                    index--;
                    } 
                %>
            </tbody>
        </table>
    </div>
</div>
<div class="page_increase"style="height: 50em">
</div>
<script>
    function checkDelete() {
        var a = confirm("are you sure?");
        if (a) {
            window.location.href = '/homepage/tasks/delete';
        }
    }

</script>







