package com.znsd.tubaba;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.znsd.tubaba.utils.Quartz;

@SpringBootApplication
@MapperScan(basePackages="com.znsd.tubaba.mapper") 
public class WebApplication {
	public static void main(String[] args) throws Exception {
		SpringApplication.run(WebApplication.class, args);
		Quartz time=new Quartz();
		time.quartz();
	}
} 
