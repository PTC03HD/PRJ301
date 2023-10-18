/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import models.*;
import java.sql.*;
import java.util.*;

public class DAO {
    private Connection con;
    private String status = "OK";
    private List<Student> std;
    private List<Menus> menu;
    private HashMap<String, Department> dept;
    private HashMap<String, String> field;
    private List<Student> fStd;
    private List<Student> sStd;
    String sqlf;

    public void loadField(){
       field = new HashMap<String, String>();
       field.put("Id", "Id");
       field.put("Name", "Name");
       field.put("Gender", "Gender");
       field.put("Departid", "Department");
       field.put("Age", "Age");
       field.put("Gpa", "Gpa");
       field.put("Add", "Add");
       field.put("Dob", "Date of birth");
    }

    public List<Student> getsStd() {
        return sStd;
    }

    public void setsStd(List<Student> sStd) {
        this.sStd = sStd;
    }

    
    
    public HashMap<String, String> getField() {
        return field;
    }

    public void setField(HashMap<String, String> field) {
        this.field = field;
    }
    
    
    
    public String getSqlf() {
        return sqlf;
    }

    public void setSqlf(String sqlf) {
        this.sqlf = sqlf;
    }
    
    
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

    public List<Student> getfStd() {
        return fStd;
    }

    public void setfStd(List<Student> fStd) {
        this.fStd = fStd;
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
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at Connection" + e.getMessage();
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
    public void filter(String deptf[], String genderf[]){
        String sql = "select * from Student ";
        if(deptf!=null){
            for(int i = 0; i < deptf.length; i++){
                if(deptf[i]!=null){
                    sql += (i==0)?"where (Departid=? or ":"Departid=? or ";
                }
                sql += (i==deptf.length-1)?"1!=1)":"";
            }
        }
        if(genderf != null && genderf.length > 0){
            sql += deptf!=null&&deptf.length>0?" and (":"where (";
            sql += genderf.length>=1?"Gender=? or ":"1!=1)";
            sql += genderf.length==2?"Gender=?)":"1!=1)";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if(deptf!=null&&deptf.length>0){
                for(int i=0; i<deptf.length; i++){
                    if(deptf[i]!=null){
                        ps.setString(i+1, deptf[i]);
                    }
                }
            }
            if(genderf!=null && genderf.length>0){
                if(genderf.length<=2)
                    ps.setInt(deptf!=null?deptf.length+1:1, Integer.parseInt(genderf[0]));
                if(genderf.length==2)
                    ps.setInt(deptf!=null?deptf.length+2:2, Integer.parseInt(genderf[1]));
            }
            
            ResultSet rs = ps.executeQuery();
            fStd = new Vector<>();
            while(rs.next()){
                fStd.add(new Student(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getDate(8)
                ));
            }
        } catch (Exception e) {
            status = "Error at filter by department: "+e.getMessage();
        }
        sqlf=sql;
    }
    
    public void Search(String mess){
        sStd = new Vector<>();
        String sql="";
        sql=mess;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                sStd.add(new Student(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getDate(8)
                ));
            }
        } catch (Exception e) {
            status = "Error at read search Student " + e.getMessage();
        }
        sqlf=sql;
    } 
}
