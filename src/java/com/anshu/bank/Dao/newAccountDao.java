/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anshu.bank.Dao;

/**
 *
 * @author HOME
 */

import static com.anshu.bank.Dao.bankDao.conn;
import com.anshu.bank.bean.newAccount;
import com.ram.bank.util.ConnectionPool;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class newAccountDao {
    static Connection conn;
    public int addAccount(newAccount na){
        
        String sql="insert into account_table values ('"+na.getAc()+"','"+na.getCn()+"','"+na.getBal()+"','"+na.getUn()+"','"+na.getPs()+"')";
        Statement stmt;
        int r=0;
        System.out.println(na.getAc());
         System.out.println(na.getCn());
          System.out.println(na.getBal());
           System.out.println(na.getUn());
         System.out.println(na.getPs());
        try {
            conn = ConnectionPool.connectDB();
            stmt =conn.createStatement();
            r=stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(newAccountDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
         
        return r;
    }
    
    //    ========================loginpage===============================================================
    
    public newAccount loginCheck(String userName,String password){
        conn=ConnectionPool.connectDB();
        newAccount na=new newAccount();
        String sql="select * from account_table where username='"+userName+"' && password='"+password+"'";
        try {
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
             na.setAc(rs.getString("account_no"));
             na.setBal(rs.getFloat("Balance")); 
             na.setCn(rs.getString("customer_Name"));
              
             
            }
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return na;
    }
    
//    ==================================addmoney============================================
    
    

public static void main(String[] args){
     newAccount na = new newAccount();
     newAccountDao nad=new newAccountDao();
     na.setAc("101");
     na.setCn("Ram");
     na.setBal(1200);
     na.setUn("Ram@123");
     na.setPs("1234");
     int r=nad.addAccount(na);
     if(r>0){
         System.out.println("Account create Success");
     }
     else{
         System.out.println("Account create Fail");
     }
//      System.out.println(nad.loginCheck("anshu123","1234"));

    
}
}
