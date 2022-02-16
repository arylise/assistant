package com.assistant.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        // Configure HttpSecurity as needed (e.g. enable http basic).
//        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.NEVER);
//        http.csrf().disable().headers().frameOptions().disable();
//        //注意：为了可以使用 http://${user}:${password}@${host}:${port}/eureka/ 这种方式登录,所以必须是httpBasic,
//        // 如果是form方式,不能使用url格式登录
//        http.authorizeRequests().anyRequest().authenticated().and().httpBasic();
        http
                // 关闭csrf防护
                .csrf().disable()
                .headers().frameOptions().disable()
                .and();
        http
                //登录处理
                .formLogin() //表单方式，或httpBasic
                .loginPage("/login")
                .loginProcessingUrl("/form")
                .defaultSuccessUrl("/index") //成功登陆后跳转页面
                .failureUrl("/loginError")
                .permitAll()
                .and();
        http
                .authorizeRequests() // 授权配置
                //无需权限访问
                .antMatchers("/admin/**","/echarts/**", "/js/**","/layui/**","/iconfont/**","/ueditor/**","/webuploader/**").permitAll()
                .antMatchers("/user/**").hasRole("USER")
                //其他接口需要登录后才能访问
                .anyRequest().authenticated()
                .and();
    }
}
