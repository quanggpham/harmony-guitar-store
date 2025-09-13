package com.quangpham.online_store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class OnlineStoreApplication {
	public static void main(String[] args) {
		SpringApplication.run(OnlineStoreApplication.class, args);
	}
}
