/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import models.*;

/**
 *
 * @author phamt
 */
public class DAO {

    public static DAO INSTANCE = new DAO();
    private Connection con;
    private String status = "OK";
    private List<Student> s;
    private List<Class1> c;
    private List<Instructor> in;

    private DAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public void loadAll() {
        String sql = "select * from Students";
        s = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s.add(new Student(rs.getString(1), rs.getString(2), rs.getDate(3),
                        rs.getBoolean(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Student: " + e.getMessage();
        }
        
        c = new Vector<>();
        sql = "select * from Classes";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.add(new Class1(rs.getString(1), rs.getString(2), rs.getDate(3)));
            }
        } catch (Exception e) {
            status = "Error at read Class: " + e.getMessage();
        }

        in = new Vector<>();
        sql = "select * from Instructors";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                in.add(new Instructor(rs.getString(1), rs.getString(2),
                        rs.getDate(3), rs.getBoolean(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Instructor: " + e.getMessage();
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Student> getS() {
        return s;
    }

    public void setS(List<Student> s) {
        this.s = s;
    }

    public List<Class1> getC() {
        return c;
    }

    public void setC(List<Class1> c) {
        this.c = c;
    }

    public List<Instructor> getIn() {
        return in;
    }

    public void setIn(List<Instructor> in) {
        this.in = in;
    }

    public void Update(String id, String name, String dob, int gender, String classID, String uId){
        String sql = "UPDATE [Students] SET [StudentID] = ?,[StudentName] = ?,"
                + "[BirthDate] = ?,[Gender] = ?,[ClassID] = ? WHERE [StudentID] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, dob);
            ps.setInt(4, gender);
            ps.setString(5, classID);
            ps.setString(6, uId);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at update student: "+e.getMessage();
        }
    }
    
    public static void main(String[] args) {
    }
}
