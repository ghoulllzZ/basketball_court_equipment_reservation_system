package com.controller.manager;

import com.entity.Broadcast_kinds;
import com.service.Broadcast_kindsService;
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
@RequestMapping("/manager/broadcast_kinds")
public class Broadcast_kindsController extends BaseManagerController {
    // 注入Service 并getter setter
    @Autowired
    private Broadcast_kindsService broadcast_kindsService;

    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        return "manager/broadcast_kinds/add";//跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Broadcast_kinds broadcast_kinds) {
         broadcast_kindsService.insert(broadcast_kinds);
        return "redirect:/manager/broadcast_kinds/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        broadcast_kindsService.delete(id);
        return "redirect:/manager/broadcast_kinds/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Broadcast_kinds broadcast_kinds) {
        broadcast_kindsService.update(broadcast_kinds);
        return "redirect:/manager/broadcast_kinds/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数





        int rowCountTotal = broadcast_kindsService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);





        //设定页面参数,传递给JSP页面
        Map<String, Object> pager = new HashMap<String, Object>();
        int pageCount = 1;// 总页数
        // 计算总页数
        if (rowCountTotal % pageSize == 0) {
            pageCount = rowCountTotal / pageSize;
        } else {
            pageCount = rowCountTotal / pageSize + 1;
        }
        pager.put("pageNumber", pageNumber);//当前页
        pager.put("pageCount", pageCount);//总页数
        pager.put("rowCountTotal", rowCountTotal);//记录总条数

        map.put("keyword", keyword);
        map.put("pager", pager);

        map.put("broadcast_kindsList", broadcast_kindsList);
        return "manager/broadcast_kinds/list";//跳转到webApp目录下对应的JSP页面
    }

    // 按条件查询数据 (模糊查询)----备用
/*
    @RequestMapping("queryBroadcast_kindsByCond.do")
    public String queryBroadcast_kindsByCond(String cond, String name, Map<String, Object> map) {
        List<Broadcast_kinds> broadcast_kindsList = new ArrayList<Broadcast_kinds>();
        Broadcast_kinds broadcast_kinds = new Broadcast_kinds();
        if (cond != null) {
            if ("broadcast_kindsname".equals(cond)) {
                broadcast_kinds.setBroadcast_kindsname(name);
                broadcast_kindsList = broadcast_kindsService.getBroadcast_kindsByLike(broadcast_kinds);
            }
        }
        map.put("broadcast_kindsList", broadcast_kindsList);
        return "manager/query";
    }
*/

    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getBroadcast_kindsById(String id, Map<String, Object> map) {
        Broadcast_kinds broadcast_kinds = broadcast_kindsService.getById(id);
        map.put("broadcast_kinds", broadcast_kinds);
        return "manager/broadcast_kinds/edit";//跳转到webApp目录下对应的JSP页面
    }



}
