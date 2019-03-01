package com.buxz.enterprise_portal.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer{

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/front").setViewName("front/index");
        registry.addViewController("/front/content").setViewName("front/content");
        registry.addViewController("/front/contact").setViewName("front/contact");
        registry.addViewController("/front/about").setViewName("front/about");
        registry.addViewController("/front/newsFrontList").setViewName("front/newsFrontList");
    }

    /* 资源处理器 */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/front/resources/**").addResourceLocations("/WEB-INF/jsp/front/");
        registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/"+"/static/");
    }
}
