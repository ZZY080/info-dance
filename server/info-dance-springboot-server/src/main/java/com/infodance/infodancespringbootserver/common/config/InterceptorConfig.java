package com.infodance.infodancespringbootserver.common.config;

import com.infodance.infodancespringbootserver.common.interceptor.AuthenticationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 所有拦截器注册
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 拦截所有请求
        registry.addInterceptor(authenticationInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/auth/**");
    }

    @Bean
    public AuthenticationInterceptor authenticationInterceptor() {
        // 自己的拦截器
        return new AuthenticationInterceptor();
    }
}
