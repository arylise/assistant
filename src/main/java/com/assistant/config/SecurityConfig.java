package com.assistant.config;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserDetailsService userDetailsService;
    private final LogoutSuccessHandler logoutSuccessHandler;

//    @Autowired
//    private AuthenticationProvider authenticationProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable();
        http
                // 关闭csrf防护
                .csrf().disable()
                .headers().frameOptions().sameOrigin()
                .httpStrictTransportSecurity().disable()
                .and();
        http
                //登录处理
                .formLogin() //表单方式，或httpBasic
                .loginPage("/login")
                .loginProcessingUrl("/login.do")
                .defaultSuccessUrl("/") //成功登陆后跳转页面
                .failureUrl("/login_error")
                .permitAll()
                .and().csrf().disable();
        http
                .authorizeRequests() // 授权配置
                //无需权限访问
                .antMatchers(
                        "/css/**",
                        "/img/**",
                        "/js/**",
                        "/layui/**",
                        "/signup**").permitAll()
//                .antMatchers(
//                        "/admin/**").hasRole("ADMIN")
                //其他接口需要登录后才能访问
                .anyRequest().authenticated()
                .and();

        http
                //登出处理
                .logout()
                .logoutSuccessHandler(logoutSuccessHandler)
                .deleteCookies("JSESSIONID")
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .and();


    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                //用户认证处理
                .userDetailsService(userDetailsService)
                //密码处理
                .passwordEncoder(new BCryptPasswordEncoder());
//        auth
//                // 自己的用户验证
//                .authenticationProvider(authenticationProvider);
    }
}
