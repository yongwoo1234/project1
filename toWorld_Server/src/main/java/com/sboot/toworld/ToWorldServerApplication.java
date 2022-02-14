package com.sboot.toworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ToWorldServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ToWorldServerApplication.class, args);
	}

}
