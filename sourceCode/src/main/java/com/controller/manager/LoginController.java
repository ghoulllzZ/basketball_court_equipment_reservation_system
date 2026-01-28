package com.controller.manager;

import com.entity.Manager;
import com.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/*后台登录*/
//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/login")
public class LoginController extends BaseManagerController {

    @Autowired
    private ManagerService managerService;


    // 管理员  登录
    @Autowired
    private Environment environment;

    @RequestMapping("login.do")
    public String login(Map<String, Object> map) {
        String username = this.getRequest().getParameter("username");
        String password = this.getRequest().getParameter("password");
        String role = this.getRequest().getParameter("role");
        String code = this.getRequest().getParameter("code");
        Boolean auto_fill_login_username = Boolean.valueOf(environment.getProperty("auto-fill-login-username"));



        Object loginCpacha = this.getRequest().getSession().getAttribute("loginCpacha");
        if (loginCpacha == null && auto_fill_login_username) {
            map.put("message", "会话超时，请刷新页面！");
            map.put("path", "manager/login_manager.jsp");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        }
        if (!code.toUpperCase().equals(loginCpacha.toString().toUpperCase()) && auto_fill_login_username) {
            map.put("message", "验证码错误！");
            map.put("path", "manager/login_manager.jsp");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        }

        //if (role.equals("管理员")) {
        Manager managerEntity = new Manager();
        managerEntity.setUsername(username);
        List<Manager> managerlist = managerService.getByCond(managerEntity);
        if (managerlist.size() == 0) {
            map.put("message", "用户名不存在");
            map.put("path", "manager/login_manager.jsp");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        } else {
            Manager manager = managerlist.get(0);
            if (password.equals(manager.getPassword())) {
                this.getRequest().getSession().setAttribute("managerid", manager.getManagerid());
                this.getRequest().getSession().setAttribute("managername", manager.getUsername());
                this.getRequest().getSession().setAttribute("realname", manager.getRealname());
                this.getRequest().getSession().setAttribute("role", role);
                return "redirect:/system/start_page.do";//跳转到action
            } else {
                map.put("message", "密码错误");
                return "manager/login_manager";//跳转到webApp目录下对应的JSP页面
            }
        }
        //}
    }


    // 管理员 退出登录
    @RequestMapping("exit.do")
    public String exit(HttpServletRequest request) {
        request.getSession().removeAttribute("managerid");
        request.getSession().removeAttribute("managername");
        request.getSession().removeAttribute("realname");
        request.getSession().removeAttribute("role");

        request.getSession().removeAttribute("members");
        request.getSession().removeAttribute("userid");

        return "manager/login_manager";//跳转到webApp目录下对应的JSP页面
    }


}
