/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import models.*;
import java.sql.*;
import java.util.*;

public class DAO {
//    public static DAO INSTANCE = new DAO();
    public static DAO INSTANCE;
    private Connection con;
    private String status = "OK";
    private List<Student> std;
    private List<Menus> menu;
    private HashMap<String, Department> dept;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public List<Menus> getMenu() {
        return menu;
    }

    public void setMenu(List<Menus> menu) {
        this.menu = menu;
    }
    
    public void loadMenu(){
        menu = new Vector<Menus>();
        String sql="select * from Menus";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                menu.add(new Menus(rs.getInt(1),rs.getString(2),rs.getString(3),
                rs.getString(4),rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Menus: " + e.getMessage();
        }
    }
    
    public DAO(){
//        if(INSTANCE == null){
//            try {
//                con = new DBContext().getConnection();
//            } catch (Exception e) {
//                status = "Error at Connection" + e.getMessage();
//            }
//        }
        if(INSTANCE == null){
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at Connection" + e.getMessage();
            }
        }
    }
    static{
        if(INSTANCE == null){
            INSTANCE = new DAO();
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Student> getStd() {
        return std;
    }

    public void setStd(List<Student> std) {
        this.std = std;
    }

    public HashMap<String, Department> getDept() {
        return dept;
    }

    public void setDept(HashMap<String, Department> dept) {
        this.dept = dept;
    }
    
    public void loadDB(){
        String sql = "select * from Student";
        std = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                std.add(new Student(
                        rs.getString("Id"), 
                        rs.getString(2), 
                        rs.getBoolean(3), 
                        rs.getString("Departid"),
                        rs.getInt(5), 
                        rs.getFloat(6), 
                        rs.getString(7), 
                        rs.getDate(8)
                ));
            }
        } catch (Exception e) {
            status = "Error at Read Student: " + e.getMessage();
        }
        
        sql = "select * from Department";
        dept = new HashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                dept.put(rs.getString(1), new Department(
                rs.getString(1),
                rs.getString(2),
                rs.getString(3))
                );
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
    }
    
    public void Insert(String id, String name, boolean gender, String departId, int age, float gpa, String add, String dob){
        String sql = "Insert into Student values(?,?,?,?,?,?,?,?)";
        try {    
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setBoolean(3, gender);
            ps.setString(4, departId);
            ps.setString(7, add);
            ps.setString(8, dob);
            ps.setInt(5, age);
            ps.setFloat(6, gpa);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert student" + e.getMessage();
        }
    }

    public void Update(String id, String name, boolean gender, String departId, 
            int age, float gpa, String add, String dob) {
        String sql = "UPDATE Student SET [Name] = ? ,[Gender] = ? ,[Departid] = ? "
                + ",[Age] = ? ,[Gpa] = ? ,[Add] = ? ,[Dob] = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(3, departId);
            ps.setString(6, add);
            ps.setString(7, dob);
            ps.setString(8, id);
            ps.setInt(4, age);
            ps.setBoolean(2, gender);
            ps.setFloat(5, gpa);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Student: "+e.getMessage();
        }
    }

    public void Delete(String id) {
        String sql = "delete from Student where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Delete Student: " + e.getMessage();
        }
    }
}
