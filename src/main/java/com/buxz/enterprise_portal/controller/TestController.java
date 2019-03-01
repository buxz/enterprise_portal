package com.buxz.enterprise_portal.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Value("${test.DBType}")
    private String type;

    @Value("${test.MySQLURL}")
    private String MySqlURL;

    @RequestMapping(value = "/test")
    public String test(){
        return type + MySqlURL;
    }

}
