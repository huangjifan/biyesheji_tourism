package com.znsd.tubaba.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.znsd.tubaba.Interceptor.LoginInterceptor;
import com.znsd.tubaba.Interceptor.LoginInterceptor2;

@Configuration
public class LoginConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/admin_index");
		registry.addInterceptor(new LoginInterceptor2()).addPathPatterns("/**");
	}
	
}
