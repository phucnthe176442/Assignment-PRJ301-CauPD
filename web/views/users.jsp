<%-- 
    Document   : users
    Created on : Jun 14, 2023, 11:05:04 PM
    Author     : Admin
--%>

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
            {{#each users}}
            <tr class="ranking_content">
                <td class="rank_rank">{{@index}}</td>
                <td class="username_rank">{{this.user_name}}</td>
                <td class="username_rank">{{this.email}}</td>
                <td class="score">{{this.score}}</td>
                <td class="score"><form action="/homepage/users/delete" method="post">
                        <input
                            type="hidden"
                            name="user_name"
                            value="{{this.user_name}}"
                            />
                        <button onclick="checkDelete()" type="submit"><i
                                class="fa-solid fa-circle-minus"
                                ></i></button>
                    </form></td>
            </tr>
            {{/each}}
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
