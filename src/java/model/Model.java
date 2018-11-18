package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Computer0
 */
public class Model {

    private static Connection conn;

    public static Connection DBConnection() {
        if (conn != null) {
            return conn;
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
                    + "databaseName=shopingcart",
                    "sa", "123456");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.toString());
        }
        return null;
    }

    public static ResultSet getData(String sql) throws Exception {
        Statement st = conn.createStatement();
        return st.executeQuery(sql);
    }

    public static boolean update(String sql) throws Exception {
        Statement st = conn.createStatement();
        return st.execute(sql);
    }

    public static long insert(String sql) throws Exception {
        PreparedStatement statement = conn.prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);
        statement.executeUpdate();
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getLong(1);
            } else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
        }
    }
}
