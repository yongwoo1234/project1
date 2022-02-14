package com.sboot.toworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ToWorldProviderApplication {

	public static void main(String[] args) {
		SpringApplication.run(ToWorldProviderApplication.class, args);
	}

}
