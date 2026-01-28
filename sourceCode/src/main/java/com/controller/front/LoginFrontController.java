package com.controller.front;

import com.entity.*;
import com.entity.Members;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import com.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class LoginFrontController extends BaseFrontController {


    @Autowired
    private MembersService membersService;
    // 注入Service 并getter setter


    /*-------------------------------------普通用户*/
    // 准备登录
    @RequestMapping("preLogin.do")
    public String prelogin() {
        this.front();
        return "login";//跳转到webApp目录下对应的JSP页面
    }

    // 用户登录
    @Autowired
    private Environment environment;

    @RequestMapping("login.do")
    public String login(Map<String, Object> map) {
        this.front();
        String username = this.getRequest().getParameter("username");
        String password = this.getRequest().getParameter("password");





        String code = this.getRequest().getParameter("code");
        Boolean auto_fill_login_username = Boolean.valueOf(environment.getProperty("auto-fill-login-username"));

        Object loginCpacha = this.getRequest().getSession().getAttribute("loginCpacha");
        if (loginCpacha == null && auto_fill_login_username) {
            map.put("message", "会话超时，请刷新页面！");
            map.put("path", "/front/preLogin.do");
            return "tips_info";//跳转到webApp目录下对应的JSP页面
        }
        if (!code.toUpperCase().equals(loginCpacha.toString().toUpperCase()) && auto_fill_login_username) {
            map.put("message", "验证码错误！");
            map.put("path", "/front/preLogin.do");
            return "tips_info";//跳转到webApp目录下对应的JSP页面
        }


        Members u = new Members();
        u.setUsername(username);
        List<Members> membersList = membersService.getByCond(u);
        if (membersList.size() == 0) {
            map.put("message", "用户名不存在");
            map.put("path", "/front/preLogin.do");
             return "tips_info";//跳转到webApp目录下对应的JSP页面

        } else {
            Members members = membersList.get(0);
            if (password.equals(members.getPassword())) {
                if ("1".equals(members.getIscooled())) {
                    map.put("message", "账户被冻结无法登录");
                    map.put("path", "/front/preLogin.do");
                     return "tips_info";//跳转到webApp目录下对应的JSP页面
                }else{
                    this.getSession().setAttribute("userid", members.getMembersid());
                    this.getSession().setAttribute("members", members);
                    this.getSession().setAttribute("role", 1);
                    return "redirect:/front/index.do";//跳转到action

                }
            } else {
                map.put("message", "密码错误");
                map.put("path", "/front/preLogin.do");
                 return "tips_info";//跳转到webApp目录下对应的JSP页面

            }
        }
    }


    // 退出登录
    @RequestMapping("exit.do")
    public String exit() {
        this.front();
        this.getSession().removeAttribute("userid");
        this.getSession().removeAttribute("members");
        this.getSession().removeAttribute("role");
        return "redirect:/front/index.do";//跳转到action
    }





}
