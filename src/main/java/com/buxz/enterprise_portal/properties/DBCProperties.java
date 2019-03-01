package com.buxz.enterprise_portal.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "test")
@PropertySource("classpath:DBConfig.properties")
public class DBCProperties {

    private int DBType;

    private String MySQLDriver;

    private String MySQLURL;

    public int getDBType() {
        return DBType;
    }

    public void setDBType(int DBType) {
        this.DBType = DBType;
    }

    public String getMySQLDriver() {
        return MySQLDriver;
    }

    public void setMySQLDriver(String mySQLDriver) {
        MySQLDriver = mySQLDriver;
    }

    public String getMySQLURL() {
        return MySQLURL;
    }

    public void setMySQLURL(String mySQLURL) {
        MySQLURL = mySQLURL;
    }
}
