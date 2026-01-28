package com.controller.manager;

import com.entity.Manager;
import com.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/manager")
public class ManagerController extends BaseManagerController {
    // 注入Service
    @Autowired
    private ManagerService managerService;


    // 修改密码
    @RequestMapping("edit_password.do")
    public String edit_password(HttpServletRequest request) {
        String managerid = (String) request.getSession().getAttribute("managerid");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        Manager manager = managerService.getById(managerid);
        if (password.equals(manager.getPassword())) {
            manager.setPassword(repassword);
            managerService.update(manager);
        } else {
            request.setAttribute("message", "旧密码错误");
        }
        return "manager/edit_password";// 跳转到webApp目录下对应的JSP页面
    }

    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {

        return "manager/manager/add";// 跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Manager manager) {
        managerService.insert(manager);
        return "redirect:/manager/manager/getAll.do";// 跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        managerService.delete(id);
        return "redirect:/manager/manager/getAll.do";// 跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Manager manager) {
        managerService.update(manager);
        return "redirect:/manager/manager/getAll.do";// 跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");// 搜索关键词
        if (keyword != null && keyword != "")
            parameter.put("keyword", keyword);// 搜索参数

        int rowCountTotal = managerService.getRowSize(parameter);// 获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; // 设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));// 当前页
        }
        parameter.put("limit", pageSize);// 搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);// 搜索参数
        List<Manager> managerList = managerService.getAll(parameter);

        // 设定页面参数,传递给JSP页面
        Map<String, Object> pager = new HashMap<String, Object>();
        int pageCount = 1;// 总页数
        // 计算总页数
        if (rowCountTotal % pageSize == 0) {
            pageCount = rowCountTotal / pageSize;
        } else {
            pageCount = rowCountTotal / pageSize + 1;
        }
        pager.put("pageNumber", pageNumber);// 当前页
        pager.put("pageCount", pageCount);// 总页数
        pager.put("rowCountTotal", rowCountTotal);// 记录总条数

        map.put("managerList", managerList);
        map.put("keyword", keyword);
        map.put("pager", pager);
        return "manager/manager/list";// 跳转到webApp目录下对应的JSP页面
    }

    // 按条件查询数据 (模糊查询)----备用
    /*
     * @RequestMapping("queryByCond.do") public String queryByCond(String
     * cond, String name, Map<String, Object> map) { List<Manager> managerList = new
     * ArrayList<Manager>(); Manager manager = new Manager(); if (cond != null) { if
     * ("username".equals(cond)) { manager.setUsername(name); managerList =
     * managerService.getByLike(manager); } if ("password".equals(cond)) {
     * manager.setPassword(name); managerList = managerService.getByLike(manager); } if
     * ("realname".equals(cond)) { manager.setRealname(name); managerList =
     * managerService.getByLike(manager); } if ("contact".equals(cond)) {
     * manager.setContact(name); managerList = managerService.getByLike(manager); } }
     * map.put("managerList", managerList); return
     * "manager/manager/list";//跳转到webApp目录下对应的JSP页面 }
     */

    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        Manager manager = managerService.getById(id);
        map.put("manager", manager);
        return "manager/manager/edit";// 跳转到webApp目录下对应的JSP页面
    }

}
