package com.fsindustry.debussy.metaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class MetaserverApp {

    public static void main(String[] args) {
        SpringApplication.run(MetaserverApp.class, args);
    }

}
