<%-- 
    Document   : loginFail
    Created on : Jun 13, 2023, 11:45:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Judge PRJ301</title>
    </head>
    <body>
        <div class="container-new">
            <div class="Right_side">
                <div class="login-box">
                    <h2>Login</h2>
                    <form method="POST" action="login">
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
    </body>
</html>
