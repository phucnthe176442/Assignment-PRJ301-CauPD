<%-- 
    Document   : homepage
    Created on : Jun 13, 2023, 11:46:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "models.Submission"%>
<%@page import = "models.Task"%>
<%@page import = "java.text.DateFormat"%>  
<%@page import = "java.text.SimpleDateFormat"%>  
<%@page import = "java.util.ArrayList"%>
<%
    boolean isAdmin =  (boolean) request.getSession().getAttribute("isAdmin");
    ArrayList<Submission> submissions = (ArrayList<Submission>) request.getAttribute("submissions");
    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="/views/css/index.css">
        <title>Online Judge PRJ301</title>
    </head>
    <body>
        <div class="container_new">
            <jsp:include page = "./common/header.jsp"/>

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
                                    <td>
                                        <form action = "tasks/show" method = "post">
                                            <input type="text" name="slug" value="<%= task.getSlug() %>" hidden="true">
                                            <input type="submit" value="<%= task.getTaskname() %>">
                                        </form>
                                    </td>
                                    <td><%= task.getScore() %></td>
                                    <% if(isAdmin) { %>
                                    <td>
                                        <form action="/tests/show" method="post">
                                            <input type="text" name="task_id" value="<%= task.getId() %>" hidden="true">
                                            <button type="submit">
                                                <i class="fa-solid fa-circle-plus"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="/tasks/delete" method="post">
                                            <input type="text" name="task_id" value="<%= task.getId() %>" hidden="true">
                                            <button onclick="return confirm('Are you sure?')" type="submit">
                                                <i class="fa-solid fa-circle-minus"></i>
                                            </button>
                                        </form>
                                    </td>
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
                            <a href="/tasks/create">
                                <button class="mt-3">Add Task</button>
                            </a>
                            <a href="users/show">
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
                                <td><%= submission.getCreatedAt().toString() %></td>
                                <% if(isAdmin) { %>
                                <td><%= submission.getUsername() %></td>
                                <% } %>
                                <td><%= submission.getTaskname() %></td>
                                <td><%= submission.getStatus() %></td>
                                <td>
                                    <form action="/submissions/show" method="post">
                                        <input 
                                            type="text" 
                                            name="submission_id" 
                                            value="<%= submission.getId() %>" 
                                            hidden="true"
                                            >
                                        <button type="submit">
                                            <i class="fa-sharp fa-solid fa-eye"></i>
                                        </button>
                                    </form>
                                </td>
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

            <jsp:include page = "./common/footer.jsp"/>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4025a1217e.js" crossorigin="anonymous"></script>
        <script src="./index.js"></script>
    </body>
</html>









