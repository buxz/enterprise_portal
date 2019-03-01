package com.buxz.enterprise_portal;

import com.buxz.enterprise_portal.properties.DBCProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({DBCProperties.class})
public class EnterprisePortalApplication {

    public static void main(String[] args) {
        SpringApplication.run(EnterprisePortalApplication.class, args);
    }

}
