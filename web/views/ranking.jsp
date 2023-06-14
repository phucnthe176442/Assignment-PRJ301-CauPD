<%-- 
    Document   : ranking
    Created on : Jun 14, 2023, 10:04:09 AM
    Author     : Admin
--%>

<%@page import = "models.entity.User"%>
<%@page import = "java.util.*"%>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    User currentUser = (User) request.getAttribute("currentUser");
%>
<div class="ranking">

    <div class="ranking_table" style="overflow-x: auto;">
        <table>
            <tr class="ranking_categories">
                <th class="rank_rank">#</th>
                <th class="username_rank">Name</th>
                <th class="score">Score</th>
            </tr>
            <%
                int rank = 1;
                for(User user: users) { 
            %>
            <tr class="ranking_content">
                <td class="rank_rank"><%= rank %></td>
                <td class="username_rank"><%= user.getUsername() %></td>
                <td class="score"><%= user.getScore() %></td>
            </tr>
            <% 
                rank++;
                } 
            %>  
        </table>
    </div>
    <ul class="ranking_end">
    </ul>
</div>

