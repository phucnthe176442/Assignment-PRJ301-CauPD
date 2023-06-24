<%-- 
    Document   : loginFail
    Created on : Jun 13, 2023, 11:45:36 PM
    Author     : Admin
--%>


<div class="container-new">
    <div class="Right_side">
        <div class="login-box">
            <h2>Login</h2>
            <form method="POST" action="/login">
                <div class="user-box">
                    <input type="text" name="username" required="" />
                    <label>Username</label>
                </div>
                <div class="user-box">
                    <input type="password" name="password" required="" />
                    <label>Password</label>
                </div>
                <div>
                    Wrong username or password!
                </div>
                <br><br><br>
                <div class="remember-me--forget-password">
                    <label>
                        <input type="checkbox" name="item" checked />
                        <span class="text-checkbox">Remember me</span>
                    </label>
                </div>
                <button type="submit">
                    Login
                </button>
            </form>
        </div>
    </div>
</div>

