package com.controller.front;

import com.entity.Members;
import com.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class MembersFrontController extends BaseFrontController {


    @Autowired
    private MembersService membersService;
    // 注入Service 并getter setter

    // 准备注册
    @RequestMapping("preReg.do")
    public String preReg() {
        this.front();
        return "register";//跳转到webApp目录下对应的JSP页面
    }

    // 用户注册
    @RequestMapping("register.do")
    public String register(Members members, Map<String, Object> map) {
        this.front();
        Members u = new Members();
        u.setUsername(members.getUsername());
        List<Members> membersList = membersService.getByCond(u);
        if (membersList.size() == 0) {

            members.setRegdate(new Date());
            membersService.insert(members);
            map.put("message", "注册成功,请登录");
            map.put("path", "/front/preLogin.do");
             return "tips_info";//跳转到webApp目录下对应的JSP页面

        } else {
            map.put("message", "用户名已存在");
            map.put("path", "/front/preReg.do");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        }
    }


    // 准备修改密码
    @RequestMapping("prePwd.do")
    public String prePwd() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        return "members/edit_password";//跳转到webApp目录下对应的JSP页面
    }

    // 修改密码
    @RequestMapping("edit_password.do")
    public String edit_password(Map<String, Object> map) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        String membersid = (String) this.getSession().getAttribute("userid");
        String password = this.getRequest().getParameter("password");
        String repassword = this.getRequest().getParameter("repassword");
        Members members = membersService.getById(membersid);
        if (password.equals(members.getPassword())) {
            members.setPassword(repassword);
            membersService.update(members);
            map.put("message", "修改成功");
            map.put("path", "/front/prePwd.do");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        } else {
            map.put("message", "旧密码错误");
            map.put("path", "/front/prePwd.do");
             return "tips_info";//跳转到webApp目录下对应的JSP页面
        }
    }


    // 准备修改信息
    @RequestMapping("preInfo.do")
    public String preInfo(Map<String, Object> map) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
                String userid = (String) this.getSession().getAttribute("userid");
        Members members = membersService.getById(userid);
        map.put("members", members);
        return "members/edit_info";//跳转到webApp目录下对应的JSP页面

    }

    // 修改信息
    @RequestMapping("edit_info.do")
    public String edit_info(Map<String, Object> map) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        String membersid = (String) this.getSession().getAttribute("userid");
        String realname = this.getRequest().getParameter("realname");
        String sex = this.getRequest().getParameter("sex");
        String qq = this.getRequest().getParameter("qq");
        String idcard = this.getRequest().getParameter("idcard");
        String email = this.getRequest().getParameter("email");
        String address = this.getRequest().getParameter("address");
        String birthday = this.getRequest().getParameter("birthday");
        String contact = this.getRequest().getParameter("contact");
        String image = this.getRequest().getParameter("image");


        Members members = membersService.getById(membersid);
        members.setRealname(realname);
        members.setSex(sex);
        members.setBirthday(birthday);
        members.setContact(contact);
        members.setImage(image);
        members.setQq(qq);
        members.setIdcard(idcard);
        members.setEmail(email);
        members.setAddress(address);




        membersService.update(members);
        map.put("message", "修改成功");
        map.put("path", "/front/preInfo.do");
        this.getSession().setAttribute("members", members);
         return "tips_info";//跳转到webApp目录下对应的JSP页面

    }


}
