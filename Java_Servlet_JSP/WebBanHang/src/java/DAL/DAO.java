/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import controllers.*;
import java.sql.*;
import java.text.NumberFormat;
import java.util.*;
import models.*;

public class DAO {

    private Connection con;
    private String status = "OK";
    private List<Product> p;
    private List<Category> c;
    private List<Users> u;
    private List<Product> pagingPro;
    private List<Bill> bill;
    private HashMap<String, BillDetail> bill_detail;

    public DAO() {
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

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public List<Product> getP() {
        return p;
    }

    public void setP(List<Product> p) {
        this.p = p;
    }

    public List<Category> getC() {
        return c;
    }

    public void setC(List<Category> c) {
        this.c = c;
    }

    public List<Users> getU() {
        return u;
    }

    public void setU(List<Users> u) {
        this.u = u;
    }

    public List<Product> getPagingPro() {
        return pagingPro;
    }

    public void setPagingPro(List<Product> pagingPro) {
        this.pagingPro = pagingPro;
    }

    public void loadDB() {
        String sql = "select * from Product_HE172007";
        p = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.add(new Product(
                        rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            status = "Error at load Product: " + e.getMessage();
        }

        sql = "select * from category_HE172007";
        c = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            status = "Error at load Category: " + e.getMessage();
        }

        sql = "select * from users_HE172007";
        u = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u.add(new Users(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4)));
            }
        } catch (Exception e) {
            status = "Error at load Category: " + e.getMessage();
        }
        
        sql = "select * from bill_HE172007";
        bill = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                bill.add(new Bill(rs.getString(1), findUser(rs.getString(2)), rs.getInt(3),
                        rs.getString(4), rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at load bill: "+e.getMessage();
        }
        
        sql = "select * from bill_detail_HE172007";
        bill_detail = new HashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                bill_detail.put(rs.getString(2), new BillDetail(rs.getString(2), rs.getString(2),
                        findProduct(rs.getString(3)), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at load bill_detail: "+e.getMessage();
        }
    } 

    public void signup(String username, String password, int isAdmin) {
        String sql = "INSERT INTO users_HE172007 ([user_name], user_pass, isAdmin) VALUES(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, isAdmin);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert user: " + e.getMessage();
        }
    }

    public boolean checkUserExist(String username) {
        for (Users user : u) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    public Users checkLogin(String username, String password) {
        for (Users user : u) {
            if (user.getUsername().equals(username) && user.getUserPass().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public int getTotalProduct() {
        String sql = "select count(*) from Product_HE172007";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at check total account: " + e.getMessage();
        }
        return 0;
    }
    
    public void pagingProduct(int index, int nrpp, String txtSearch, String cate[],
             String minPrice, String maxPrice) {
        pagingPro = new Vector<>();
        String sql = "select * from Product_HE172007 ";
        if (cate != null) {
            for (int i = 0; i < cate.length; i++) {
                if (cate[i] != null) {
                    sql += (i == 0) ? "where (category_id=? or " : "category_id=? or ";
                }
                sql += (i == cate.length - 1) ? "1!=1)" : "";
            }
            sql += " and product_name like ? and (product_price between ? and ?) ";
        } else {
            sql += "where product_name like ? and (product_price between ? and ?) ";
        }
        sql += "order by product_name offset ? rows fetch next ? rows only";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (cate != null && cate.length > 0) {
                for (int i = 0; i < cate.length; i++) {
                    if (cate[i] != null) {
                        ps.setString(i + 1, cate[i]);
                    }
                }
                ps.setString(cate.length + 1, "%" + txtSearch + "%");
                ps.setString(cate.length + 2, minPrice);
                ps.setString(cate.length + 3, maxPrice);
                ps.setInt(cate.length + 4, (index - 1) * nrpp);
                ps.setInt(cate.length + 5, nrpp);
            } else {
                ps.setString(1, "%" + txtSearch + "%");
                ps.setString(2, minPrice);
                ps.setString(3, maxPrice);
                ps.setInt(4, (index - 1) * nrpp);
                ps.setInt(5, nrpp);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pagingPro.add(new Product(
                        rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            status = "Error at paging Product: " + e.getMessage();
        }
    }

    public void InsertProduct(String cateId, String name, String price,
            String desc, String quantity, String img, String discount, String hot, String createBy) {
        String sql = "INSERT INTO product_HE172007(category_id,product_name,"
                + "product_price,product_describe,quantity,img,discount,hot,createBy)"
                + " VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setString(4, desc);
            ps.setString(5, quantity);
            ps.setString(6, img);
            ps.setString(7, discount);
            ps.setString(8, hot);
            ps.setString(9, createBy);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at Insert product" + e.getMessage();
        }
    }

    public void deleteProduct(int pid) {
        String sql = "delete from Product_HE172007 where product_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at delete product: " + e.getMessage();
        }
    }

    public void Update(String id, String cateId, String name, String price,
            String desc, String quantity, String img, String discount, String hot, String createBy) {
        String sql = "UPDATE product_HE172007 SET [category_id] = ?,[product_name] = ?,"
                + "[product_price] = ?,[product_describe] = ?,[quantity] = ?,[img] = ?,"
                + "[discount] = ?,[hot] = ?,[createBy] = ? WHERE product_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setString(4, desc);
            ps.setString(5, quantity);
            ps.setString(6, img);
            ps.setString(7, discount);
            ps.setString(8, hot);
            ps.setString(9, createBy);
            ps.setString(10, id);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at Update product: " + e.getMessage();
        }
    }

    public Product findProduct(String pid) {
        for (Product pro : p) {
            if (pro.getId().equals(pid)) {
                return pro;
            }
        }
        return null;
    }

    public String convertMoney(int money) {
        NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return format.format(money);
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        d.loadDB();
    }

    public String getMaxPrice() {
        String sql = "select MAX(product_price) from product_HE172007";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            status = "Error at get Max Price: " + e.getMessage();
        }
        return "-1";
    }

    public String getMinPrice() {
        String sql = "select MIN(product_price) from product_HE172007";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            status = "Error at get Min Price: " + e.getMessage();
        }
        return "-1";
    }
    
    public void deleteUser(int uid) {
        String sql = "delete from users_HE172007 where user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at delete user: " + e.getMessage();
        }
    }
    
    public Users findUser(String uid) {
        for (Users user: u) {
            if ((user.getUid()+"").equals(uid)) {
                return user;
            }
        }
        return null;
    }
}
