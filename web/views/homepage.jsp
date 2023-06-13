<%-- 
    Document   : homepage
    Created on : Jun 13, 2023, 11:46:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="./views/css/index.css">
        <title>Online Judge PRJ301</title>
    </head>
    <body>
        <header class="header">
            <form method="post" action="/homepage/users/updateName">
                <div class="popup_change_username">
                    <div class="change_username">
                        <p>Username Setting</p>
                        <div>
                            <p id="old_username">Old Username:</p> <input type="text" name="old_username" required>
                            <div id="seperate"></div>
                        </div>
                        <div>
                            <p id="new_username">New Username:</p> <input type="text" name="new_username" required> 
                            <div id="seperate"></div>
                        </div>

                        <div class="btns"> 
                            <button id="cancel_username" type="button">Cancel</button>   
                            <button id="confirm" type="submit" name="typeFunction" value="2">Confirm</button>
                        </div>
                    </div>
                </div>
            </form>

            <form method="post" action="/homepage/users/updatePass">
                <div class="popup_change_password">
                    <div class="change_password">
                        <p>Password Setting</p>
                        <div>
                            <p id="old_password">Old Password:</p> <input type="password" name="old_password" required>
                            <div id="seperate"></div>
                        </div>
                        <div>
                            <p id="new_password">New Password:</p> <input type="password" name="new_password" required>
                            <div id="seperate"></div>
                        </div>

                        <div class="btns">
                            <button id="cancel_password" type="button">Cancel</button>
                            <button id="confirm" type="submit" name="typeFunction" value="1">Confirm</button>

                        </div>
                    </div>
                </div>
            </form>

            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/homepage">
                        <div class="nav_logo">
                            <img class="logo" src="./public/img/logo.png" alt="logo">
                            <div class="name-website">
                                PRJ301 Project
                            </div>
                        </div>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/homepage">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ranking">Ranking</a>
                            </li>
                        </ul>
                        {{#if username}}
                        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">

                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div id="username">
                                        {{ username }}
                                    </div>
                                    <i id="user_symbol" class="fa-solid fa-user"></i>
                                </a>

                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#" id="btn_change_password">Change password</a></li>
                                    <li><a class="dropdown-item" href="#" id="btn_change_username">Change username</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="/">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                        {{/if}}
                    </div>
                </div>
            </nav>
        </header>
        <h1>Login Success</h1>
        <footer class="footer">
            <ul class="nav_item logo_footer">
                <li class="nav_logo">
                    <img src="./public/img/logo.png" href="" alt="logo" class="logo">
                </li>
            </ul>

            <div class="nav_item_footer1_and_2">
                <ul class="nav_item_footer1">
                    <li>
                        <div class="nav_btn"><a href="">Contact</a></div>
                    </li>
                    <li>
                        <div class="nav_btn"><a href="">Contribute</a></div>
                    </li>
                    <li>
                        <div class="nav_btn"><a href="">Source Code</a></div>
                    </li>
                </ul>

                <ul class="nav_item_footer2">
                    <li id="ctv">phucnthe176442 ©2023</li>
            </div>

            <ul class="nav_item logo_footer"></ul>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/4025a1217e.js" crossorigin="anonymous"></script>
        <script src="./index.js"></script>
    </body>
</html>
