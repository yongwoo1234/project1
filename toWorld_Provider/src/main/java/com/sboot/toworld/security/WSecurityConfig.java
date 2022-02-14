package com.sboot.toworld.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration 
@EnableWebSecurity
public class WSecurityConfig extends WebSecurityConfigurerAdapter { 
   
   @Autowired
   private DataSource dataSource;
   
   @Override
   protected void configure(HttpSecurity hs1) throws Exception {
      
      
//      hs1.httpBasic().and().authorizeRequests()   
      
      hs1.authorizeRequests()

      .antMatchers("/", "/css/**", "/home", "/join/**", "/images/**").permitAll()
      .anyRequest().authenticated()
     
      
      .and()
	  .formLogin().loginPage("/login").permitAll()
      .loginProcessingUrl("/login-Process")
      .defaultSuccessUrl("/loginSuccess",true)
      
      .failureUrl("/loginFail").permitAll() // default
      
      .and()
      
     
      
      .logout().permitAll()
         
      
     
 
//      .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//      .addLogoutHandler(new TaskImplementingLogoutHandler()).permitAll().logoutSuccessUrl("/"); 
      
      .and().csrf().disable();
      
   }   //configure-end

   @Autowired
   public void configureGlobal(AuthenticationManagerBuilder auth) 
     throws Exception {
       auth.jdbcAuthentication()
         .dataSource(dataSource)
         .passwordEncoder(new BCryptPasswordEncoder())
         .usersByUsernameQuery("select username,password,enabled "
           + "from authuser "
           + "where username = ?")
         .authoritiesByUsernameQuery("select username,role "
           + "from authuser "
           + "where username = ?");
   }
   
   
//   @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        System.out.println(passwordEncoder().encode("123"));
//        
//        auth.jdbcAuthentication()
//            .dataSource(dataSource)
//            .rolePrefix("ROLE_")
//            
//            .usersByUsernameQuery("select name as userName, password, enabled"
//                                    + " from user_list where name = ?")
//            .authoritiesByUsernameQuery("select name as userName, authority "
//                                    + " from user_list where name= ?")
//            .passwordEncoder(new BCryptPasswordEncoder());
//    }

   
   @Bean
   public PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
   }          
}//end