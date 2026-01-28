package com.controller.front;

import com.entity.Broadcast;
import com.entity.Broadcast_kinds;
import com.entity.Members;
import com.service.BroadcastService;
import com.service.Broadcast_kindsService;
import com.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front_broadcast")
public class BroadcastMembersController extends BaseFrontController {
    // 注入Service 并getter setter
    @Autowired
    private BroadcastService broadcastService;
    @Autowired
    private Broadcast_kindsService broadcast_kindsService;
    @Autowired
    private MembersService membersService;

    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        map.put("broadcast_kindsList", broadcast_kindsList);
        return "members/broadcast_add";//跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Broadcast broadcast) {
        broadcast.setHits("0");
        String membersid = (String) this.getSession().getAttribute("userid");
        broadcast.setMembersid(membersid);//当前登录的备用权限ID
        broadcast.setAddtime(new Date());
        broadcastService.insert(broadcast);
        return "redirect:/front_broadcast/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        broadcastService.delete(id);
        return "redirect:/front_broadcast/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Broadcast broadcast) {
        broadcastService.update(broadcast);
        return "redirect:/front_broadcast/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        String membersid = (String) this.getSession().getAttribute("userid");
        Members members = membersService.getById(membersid);
        parameter.put("membersid", members.getMembersid());//只获取当前登录的备用权限

        int rowCountTotal = broadcastService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Broadcast> broadcastList = broadcastService.getAll(parameter);


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
        map.put("broadcastList", broadcastList);
        return "members/broadcast";//跳转到webApp目录下对应的JSP页面
    }



    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();
        Broadcast broadcast = broadcastService.getById(id);
        map.put("broadcast", broadcast);
        // List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        // map.put("broadcast_kindsList", broadcast_kindsList);
        return "members/broadcast_edit";//跳转到webApp目录下对应的JSP页面
    }

}
