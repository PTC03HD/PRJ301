/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.*;
import java.util.*;

public class DAO {
    private Connection con;
    private String status = "OK";

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

}
