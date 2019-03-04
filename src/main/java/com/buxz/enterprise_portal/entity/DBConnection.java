package com.buxz.enterprise_portal.entity;            //指定类所在的包

import com.buxz.enterprise_portal.utils.PropertiesLoader;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static PropertiesLoader loader = new PropertiesLoader("DBConfig.properties");

    private Connection conn;            //连接对象

    public DBConnection() {
        conn = null;
    }

    public Connection getConn() {
        String DBType = loader.getProperty("test.DBType");
        switch (Integer.parseInt(DBType)) {
            case 1:
                return (getConnToMySql());
            default:
                return null;
        }
    }


    public Connection getConnToMySql() {
        try {
            Class.forName(loader.getProperty("test.MySQLDriver")).newInstance();
            conn = DriverManager.getConnection(loader.getProperty("test.MySQLURL"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
