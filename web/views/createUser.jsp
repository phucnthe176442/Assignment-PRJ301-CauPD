<%-- 
    Document   : createUser
    Created on : Jun 25, 2023, 10:54:02 PM
    Author     : Admin
--%>

<form method="post" action="/homepage/users/create">
    <div class="mb-3">
        <label for="user_name" class="form-label">User name</label>
        <input
            type="text"
            name="user_name"
            class="form-control"
            id="user_name"
            placeholder="Enter user name"
            required
            />
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input
            type="email"
            name="email"
            class="form-control"
            id="email"
            placeholder="Enter email"
            required
            />
    </div>
    <button type="submit">Add User</button>
</form>
