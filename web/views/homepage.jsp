<%-- 
    Document   : homepage
    Created on : Jun 13, 2023, 11:46:17 PM
    Author     : Admin
--%>


<%@page import = "models.entity.Submission"%>
<%@page import = "java.text.DateFormat"%>  
<%@page import = "java.text.SimpleDateFormat"%>  
<%@page import = "java.util.*"%>
<%
    boolean isAdmin =  (boolean) request.getAttribute("isAdminMode");
    List<Submission> submissions = (List<Submission>) request.getAttribute("submissions");
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
                    <!--                    {{#tasksTable
                                tasks pageTask.begin pageTask.end isAdmin
                                        }}{{/tasksTable}}-->
                </tbody>
            </table>
            <form action="/homepage" method="post" class="pagination">
                <input
                    type="hidden"
                    min="0"
                    name="indexTask"
                    value={{pageTask.index}}
                    />
                <input
                    type="hidden"
                    min="0"
                    name="totalPageTask"
                    value={{pageTask.totalPage}}
                    />
                <!--                {{#if taskHome}}
                                <input type="submit" name="btnHomeTask" value="<<" />
                                <input type="submit" name="btnPreTask" value="<" />
                                {{/if}}
                                {{#displayPageTask
                          pageTask.pageStart pageTask.pageEnd pageTask.index
                                }}{{/displayPageTask}}
                                {{#if taskEnd}}
                                <input type="submit" name="btnNextTask" value=">" />
                                <input type="submit" name="btnEndTask" value=">>" />
                                {{/if}}-->
            </form>
            <%  if(isAdmin) { %>
            <div class="userFunction userFunction_small mt-4">
                <a href="/homepage/tasks/showCreate">
                    <button class="mt-3">Add Task</button>
                </a>
                <a href="/homepage/users/showAll">
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
                    int index = (int) submissions.size();
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
        <form action="/homepage" method="post" class="pagination">
            <input type="hidden" min="0" name="index" value={{page.index}} />
            <input type="hidden" min="0" name="totalPage" value={{page.totalPage}} />
            <!--            {{#if subHome}}
                        <input type="submit" name="btnHome" value="<<" />
                        <input type="submit" name="btnPre" value="<" />
                        {{/if}}
                        {{#displayPageSubmission
                    page.pageStart page.pageEnd page.index
                        }}{{/displayPageSubmission}}
                        {{#if subEnd}}
                        <input type="submit" name="btnNext" value=">" />
                        <input type="submit" name="btnEnd" value=">>" />
                        {{/if}}-->
        </form>
        <div style="height:10em">

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
</div>



