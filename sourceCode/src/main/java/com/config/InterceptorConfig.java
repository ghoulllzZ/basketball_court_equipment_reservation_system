package com.config;

import com.interceptor.ManagerLoginInterceptor;
import com.interceptor.FrontLoginInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


//拦截器

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 通过@Bean注解，将我们定义的拦截器注册到Spring容器
     *
     * @return
     */
 /*   @Bean
    public HandlerInterceptor loginInterceptor(){
        return new FrontLoginInterceptor();
    }
*/
    //注入场地器材的名称
    @Value("${server.servlet.context-path}")
    private String context_path;

    /**
     * 重写接口中的addInterceptors方法，添加自定义拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //System.out.println(context_path);


        //M do后辍
        //FRONT action后辍


        //先将静态资源排除
        //后台访问拦截器
        registry.addInterceptor(new ManagerLoginInterceptor())
                .excludePathPatterns(
                        "/resources_web/**"
                        , "/upload_files/**"
                        , "/manager/login/login.do"
                        , "/manager/login/members/getById.do"
                )//排除的连接
                .addPathPatterns("/manager/**")//未登录所有连接不可以访问

        ;


        //前台访问拦截器  普通 用户
        registry.addInterceptor(new FrontLoginInterceptor())
                .excludePathPatterns(
                        "/front/**"
                )//排除的连接
                .addPathPatterns(
                        "/front/cancel.do"
                        , "/front/prePwd.do"
                        , "/front/edit_password.do"
                        , "/front/edit_info.do"
                        , "/front/preInfo.do"
                );//未登录所有连接不可以访问


    }
}