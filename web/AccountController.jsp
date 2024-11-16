<%-- 
    Document   : AccountController
    Created on : Jun 9, 2024, 10:21:56 AM
    Author     : HOME
--%>

<%@page import="com.anshu.bank.Dao.newAccountDao"%>
<%@page import="com.anshu.bank.bean.newAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .acccont{
              height: 450px;
             width: 300px;
             margin-top: 100px;
             margin-left:450px; 
             
             color: white;
              padding-top: 100px;
             padding-left: 180px;
              background-image: url("https://media.istockphoto.com/id/1497285758/vector/abstract-dark-blue-blurred-defocused-gradient-background.jpg?s=1024x1024&w=is&k=20&c=8VauXSB-QByqTeUkLfCNoF0ijgH44iBGoYjGYDEiWyU=")
            }
            .acccont a{
                text-decoration: none;
                color: white;
               
                font-size: 35px;
            }
        </style>
    </head>
    <body>
       <%
           String str="";
           if(request.getParameter("acno")!=null && request.getParameter("cn")!=null && request.getParameter("bal")!=null){
       String acno=request.getParameter("acno");
       String customerName=request.getParameter("cn");
       Float balance =Float.parseFloat(request.getParameter("bal"));
       String user=request.getParameter("un");
       String pass=request.getParameter("ps");
        newAccount na=new newAccount();
        na.setAc(acno);
        na.setBal(balance);
        na.setCn(customerName);
        na.setUn(user);
        na.setPs(pass);
        newAccountDao nad=new newAccountDao();
        int r=nad.addAccount(na);
        
        if(r>0){
            str="Account create Success";
            response.sendRedirect("LoginPage.jsp");
        }
           }
       %>
       <div class="acccont">
           
           <h1><%= str%></h1><br>
       <h2><a href="./LoginPage.jsp">Login here</a></h2>
       <h2><a hre
       </div>
       
     
    </body>
</html>
