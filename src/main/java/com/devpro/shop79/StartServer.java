package com.devpro.shop79;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class StartServer {
public static void main(String[] args) {
	System.out.println("Start server...");
	SpringApplication.run(StartServer.class,args );
}
}