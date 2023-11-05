/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author phamt
 */
public class Instructor {
    private String inId;
    private String inName;
    private Date dob;
    private boolean gender;
    private int classID;

    public Instructor() {
    }

    public Instructor(String inId, String inName, Date dob, boolean gender, int classID) {
        this.inId = inId;
        this.inName = inName;
        this.dob = dob;
        this.gender = gender;
        this.classID = classID;
    }

    public String getInId() {
        return inId;
    }

    public void setInId(String inId) {
        this.inId = inId;
    }

    public String getInName() {
        return inName;
    }

    public void setInName(String inName) {
        this.inName = inName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }
    
    
}
