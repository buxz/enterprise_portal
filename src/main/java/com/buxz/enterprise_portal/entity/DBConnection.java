package com.buxz.enterprise_portal.entity;            //指定类所在的包

import com.buxz.enterprise_portal.properties.DBCProperties;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;

@Component
public class DBConnection extends{
    public static void main(String[] args) {
        ApplicationContext ac2 =  ContextLoader.getCurrentWebApplicationContext();
        DBCProperties dbcProperties = ((DBCProperties) ac2.getBean("dbcProperties"));
        System.out.println(dbcProperties.getDBType());
        System.out.println("Dddddd");
    }

    private Connection conn;            //连接对象


    @Value("${test.DBType}")
    private int DBType;                    //数据库类型

    @Value("${test.MySQLDriver}")
    private String MySqlDriver;            //MYSQL Server驱动程序

    @Value("${test.MySQLURL}")
    private String MySqlURL;            //MYSQL Server连接字符串


    public DBConnection() {
        conn = null;
    }

//    @Bean
    public Connection getConn() {
        System.out.println("DBType=="+DBType);
        System.out.println("MySqlDriver=="+MySqlDriver);
        System.out.println("MySqlURL=="+MySqlURL);
        switch (DBType) {
            case 1:
                return (getConnToMySql());
            default:
                return null;
        }
    }


//    @Bean
    public Connection getConnToMySql() {
        try {
            Class.forName(MySqlDriver).newInstance();
            conn = DriverManager.getConnection(MySqlURL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
