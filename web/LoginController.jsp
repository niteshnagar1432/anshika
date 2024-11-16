<%-- 
    Document   : LoginController
    Created on : Jun 9, 2024, 9:44:08 AM
    Author     : HOME
--%>

<%@page import="com.anshu.bank.bean.newAccount"%>
<%@page import="com.anshu.bank.Dao.newAccountDao"%>
<%@page import="com.anshu.bank.Dao.bankDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String str="";
            if(request.getParameter("un")!=null && request.getParameter("ps")!=null){
            String un=request.getParameter("un");
            String ps=request.getParameter("ps");
            newAccountDao nad=new newAccountDao();
            newAccount na=nad.loginCheck(un,ps);
//            na.setUn(un);
//            na.setPs(ps);
           
            if(na!=null){
                out.println("Login Sucess");
                HttpSession hs=request.getSession();
                hs.setAttribute("user",na);
                response.sendRedirect("transfer.jsp");
            }
            
            else{
                out.println("Please Enter the value");
                response.sendRedirect("LoginPage.jsp");
            }
            }
        %>
    </body>
</html>
