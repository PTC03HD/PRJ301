/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author 21H1 HNQA
 */
public class AcG {
    private int cid;
    private String cname;
    private int gender;
    private Date dob;
    private String gname;
    private String cre;

    public AcG() {
    }

    public AcG(int cid, String cname, int gender, Date dob, String gname, String cre) {
        this.cid = cid;
        this.cname = cname;
        this.gender = gender;
        this.dob = dob;
        this.gname = gname;
        this.cre = cre;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

  

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getCre() {
        return cre;
    }

    public void setCre(String cre) {
        this.cre = cre;
    }
    
    
    
}
