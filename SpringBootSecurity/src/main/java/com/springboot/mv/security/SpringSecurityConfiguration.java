package com.springboot.mv.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


import com.springboot.mv.security.service.LoginUserDetailsService;

@EnableWebSecurity
@Configuration
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	LoginUserDetailsService detailsService;
	
	@Autowired
	private CustomerAuthenticationHandler authenticationHandler;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(detailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		
		http.authorizeRequests()
		.antMatchers("/admin/**")
		.hasRole("ADMIN")
		.antMatchers("/customer/**")
		.hasRole("CUSTOMER")
		.antMatchers("/", "/register")
		.permitAll()
		.and()
		.formLogin()
		.loginPage("/loginPage")
		.permitAll()
		.successHandler(authenticationHandler)
		.and()
		.logout()
		.permitAll();
				
	}

}