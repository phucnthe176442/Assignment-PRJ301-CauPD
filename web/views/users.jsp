<%-- 
    Document   : users
    Created on : Jun 14, 2023, 11:05:04 PM
    Author     : Admin
--%>
<%@page import = "models.entity.User" %>
<%@page import = "java.util.List" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>

<div class="ranking" style="overflow-x: auto;">
    <a href="/homepage/users/show"><button class="btn_addmore" type="submit">Add
            more</button></a>


    <div class="ranking_table" style="overflow-x: auto;">
        <table>
            <tr class="ranking_categories">
                <th class="rank_rank">#</th>
                <th class="username_rank">Name</th>
                <th class="username_rank">Mail</th>
                <th class="score">Score</th>
                <th class="score">Delete</th>
            </tr>
            <% 
                int rank = 1;
                for(User user : users) { %>
            <tr class="ranking_content">
                <td class="rank_rank"><%= rank %></td>
                <td class="username_rank"><%= user.getUsername() %></td>
                <td class="username_rank"><%= user.getEmail() %></td>
                <td class="score"><%= User.getScore() %></td>
                <td class="score"><form action="/homepage/users/delete" method="post">
                        <input
                            type="hidden"
                            name="user_name"
                            value="<%= user.getUsername() %>"
                            />
                        <button onclick="checkDelete()" type="submit"><i
                                class="fa-solid fa-circle-minus"
                                ></i></button>
                    </form></td>
            </tr>
            <% } %>
        </table>
    </div>
    <ul class="ranking_end">

    </ul>
</div>

<script>
    function checkDelete() {
        var a = confirm("are you sure?");
        if (a) {
            window.location.href = '/homepage/tasks/delete';
        }
    }

</script>