/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import models.*;
import java.util.*;
import java.sql.*;
import java.util.List;

/**
 *
 * @author phamt
 */
public class DAO {
    private Connection con;
    private String status = "OK";
    private List<Students> std;
    private HashMap<String, Departments> dept;
    
    public DAO(){ //goi phuong thuc DAO de thiet lap ket noi voi database
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at Connections: "+ e.getMessage();
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Students> getStd() {
        return std;
    }

    public void setStd(List<Students> std) {
        this.std = std;
    }

    public HashMap<String, Departments> getDept() {
        return dept;
    }

    public void setDept(HashMap<String, Departments> dept) {
        this.dept = dept;
    }
    
    public void loadDb(){ //lay du lieu tu database cho vao List voi Hashmap
        String sql = "select * from Student";
        std = new Vector<Students>(); //???
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                std.add(new Students(rs.getString(1), rs.getString(2), rs.getBoolean(3), 
                        rs.getString(4), rs.getInt(5), rs.getFloat(6),
                        rs.getString(7), rs.getDate(8)));
            }
        } catch (Exception e) {
            status = "Error at read Student: " + e.getMessage();
        }
        
        sql = "select * from Department";
        dept = new HashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                dept.put(rs.getString(1), new Departments(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3)));
            }
        } catch (Exception e) {
            status = "Error at read Department: " + e.getMessage();
        }
    }
    
    public void Insert(String id, String name, boolean gender, String departId, int age, float gpa, String add, String dob){
        String sql = "Insert into Student Values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setBoolean(3, gender);
            ps.setString(4, departId);
            ps.setInt(5, age);
            ps.setFloat(6, gpa);
            ps.setString(7, add);
            ps.setString(8, dob);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert value: " + e.getMessage();
        }
    }
    
    public void Update(String id, String name, boolean gender, String departId, int age, float gpa, String add, String dob){
        String sql = "UPDATE Student SET [Name] = ? ,[Gender] = ? ,[Departid] = ? "
                + ",[Age] = ? ,[Gpa] = ? ,[Add] = ? ,[Dob] = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setBoolean(3, gender);
            ps.setString(4, departId);
            ps.setInt(5, age);
            ps.setFloat(6, gpa);
            ps.setString(7, add);
            ps.setString(8, dob);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update value: " + e.getMessage();
        }
    }
    
    public void Delete(String id){
        String sql = "Delete from Student where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Delete value: " + e.getMessage();
        }
    }
}
