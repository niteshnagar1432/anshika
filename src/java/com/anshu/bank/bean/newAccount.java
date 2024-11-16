/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anshu.bank.bean;

/**
 *
 * @author HOME
 */
public class newAccount {
    private String ac;
    private String cn;
    private float bal;
   private String un;
   private String ps;

    public newAccount() {
    }

    public newAccount(String ac, String cn, float bal, String un, String ps) {
        this.ac = ac;
        this.cn = cn;
        this.bal = bal;
        this.un = un;
        this.ps = ps;
    }

    public String getAc() {
        return ac;
    }

    public void setAc(String ac) {
        this.ac = ac;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    public float getBal() {
        return bal;
    }

    public void setBal(float bal) {
        this.bal = bal;
    }

    public String getUn() {
        return un;
    }

    public void setUn(String un) {
        this.un = un;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }

    @Override
    public String toString() {
        return "newAccount{" + "ac=" + ac + ", cn=" + cn + ", bal=" + bal + ", un=" + un + ", ps=" + ps + '}';
    }
  

    

    
}
