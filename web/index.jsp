<%-- 
    Document   : index
    Created on : Jun 23, 2024, 7:54:54 PM
    Author     : HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .back{
                background-repeat: no-repeat;
                border: 2px solid black;
                height: 600px;
                width: 1200px;
                margin-top: 50px;
                margin-left: 140px;
               background-size: cover;
                background-image: url("https://media.istockphoto.com/id/1330187934/vector/abstract-dark-blue-background-with-lines-vector.jpg?s=2048x2048&w=is&k=20&c=OyHlIziRttlVcV5NQe_l5xPgMnHlR5o82d_hYluPZ8o=")
            }
            .nav{
                display: flex;
                margin: 20px;
                justify-content: flex-end;
            }
            .nav li{
                margin:20px;
                font-size: 22px;
                list-style-type: none;
            }
            .nav li a{
                color: white;
                text-decoration: none;
            }
            .head{
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                padding: 100px;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <div class="back">
            <ul class="nav">
            <li> <a href="./LoginPage.jsp">Login here</a></li>
            <li><a href="./new_account.jsp">Create New Account</a></li>
        </ul>
            <div class="head">
            <h1>Simple and Saving Bank</h1>
            </div>
        </div>
    </body>
</html>
