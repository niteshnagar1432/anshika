<%-- 
    Document   : transferController
    Created on : Jun 9, 2024, 12:10:41 PM
    Author     : HOME
--%>


<%@page import="com.anshu.bank.bean.newAccount"%>
<%@page import="com.anshu.bank.Dao.bankDao"%>
<%@page import="com.anshu.bank.bean.bankBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <%
             newAccount na=(newAccount)session.getAttribute("user");
            String str="";
          if(request.getParameter("acno")!=null && request.getParameter("toacno")!=null && request.getParameter("tdate")!=null && request.getParameter("tamount")!=null){
          String acno=request.getParameter("acno");
          String toacno=request.getParameter("toacno");
          String tdate=request.getParameter("tdate");
          float tamount=Float.parseFloat(request.getParameter("tamount"));
          bankBean bb=new bankBean();
          
          bb.setAccount_no(acno);
          bb.setBeneficiar_acc_no(toacno);
          bb.setTransactionAmount(tamount);
          bb.setTransactionDate(tdate);
          bankDao bd=new bankDao();
          boolean b=bd.transferMoney(bb);
          if(b){
              str="Amount Transfer Success";
                  response.sendRedirect("view.jsp");
          }
          else{
              out.println("Transfer fail");
              
          }
          }
          
        %>
        <h1><%= str%></h1>
    
</html>