<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login NguyenLinhNP</title>
    <link rel="stylesheet" href="./login_form_2.css">
    <style>

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .flex-div {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .name-content {
            margin-right: 7rem;
        }

        .name-content .logo {
            font-size: 3.5rem;
            color: #1877f2;
        }

        .name-content p {
            font-size: 1.3rem;
            font-weight: 500;
            margin-bottom: 5rem;
        }

        form {
            display: flex;
            flex-direction: column;
            background: #fff;
            padding: 2rem;
            width: 530px;
            height: 380px;
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        form input {
            outline: none;
            padding: 0.8rem 1rem;
            margin-bottom: 0.8rem;
            font-size: 1.1rem;
        }

        form input[type="password"] {

            background-color: #f9f9f9;
            border: 1px solid #ddd;
        }

        .login {

            background-color: #1877f2;
            color: #ffffff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .login:hover {
            background-color: #0e63ad;
        }


        .create-account {
            background-color: #42b72a;
            color: #ffffff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .create-account:hover {
            background-color: #359c1d;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="flex-div">
        <div class="name-content">
            <h1 class="logo">NguyenLinhNP</h1>
            <p>Enjoy love from Linhdz</p>
        </div>
        <form method = "POST" action = "./login">
            <input name = "username" type="text" placeholder="Email or Phone Number" required>
            <input name = "password" type="password" placeholder="Password" required>
            <button class="login">Log In</button>
            <% String message = "";
                message = (String)request.getAttribute("message");
            %>
            <%if (message != null) {
            %> <span><font color="red"><%= message %></font></span><%
            }
        %>
            <hr>
            <form>
                <button type="reset" onclick="location.href='/demo2_war_exploded/register'", class="create-account">
                    Create new account
                </button>
            </form>
        </form>
    </div>
</div>
</body>
</html>
