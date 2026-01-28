package com.controller.manager;

import com.entity.Broadcast;
import com.entity.Broadcast_kinds;
import com.service.BroadcastService;
import com.service.Broadcast_kindsService;
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
@RequestMapping("/manager/broadcast")
public class BroadcastController extends BaseManagerController {
    // 注入Service 并getter setter
    @Autowired
    private BroadcastService broadcastService;
    @Autowired
    private Broadcast_kindsService broadcast_kindsService;

    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        map.put("broadcast_kindsList", broadcast_kindsList);
        return "manager/broadcast/add";//跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Broadcast broadcast) {
        broadcast.setHits("0");
        broadcast.setAddtime(new Date());
        broadcastService.insert(broadcast);
        return "redirect:/manager/broadcast/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        broadcastService.delete(id);
        return "redirect:/manager/broadcast/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Broadcast broadcast) {
        broadcastService.update(broadcast);
        return "redirect:/manager/broadcast/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数
        String broadcast_kindsid = request.getParameter("broadcast_kindsid");//搜索关键词
        if (broadcast_kindsid != null && broadcast_kindsid != "") parameter.put("broadcast_kindsid", broadcast_kindsid);//搜索参数


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
        return "manager/broadcast/list";//跳转到webApp目录下对应的JSP页面
    }

    // 按条件查询数据 (模糊查询)----备用
/*
    @RequestMapping("queryBroadcastByCond.do")
    public String queryBroadcastByCond(String cond, String name, Map<String, Object> map) {
        List<Broadcast> broadcastList = new ArrayList<Broadcast>();
        Broadcast broadcast = new Broadcast();
        if (cond != null) {
            if ("title".equals(cond)) {
                broadcast.setTitle(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("image".equals(cond)) {
                broadcast.setImage(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("broadcast_kindsid".equals(cond)) {
                broadcast.setBroadcast_kindsid(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("istop".equals(cond)) {
                broadcast.setIstop(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("isflv".equals(cond)) {
                broadcast.setIsflv(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("contents".equals(cond)) {
                broadcast.setContents(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("addtime".equals(cond)) {
                broadcast.setAddtime(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
            if ("hits".equals(cond)) {
                broadcast.setHits(name);
                broadcastList = broadcastService.getBroadcastByLike(broadcast);
            }
        }
        map.put("broadcastList", broadcastList);
        return "manager/query";
    }
*/

    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        Broadcast broadcast = broadcastService.getById(id);
        map.put("broadcast", broadcast);
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        map.put("broadcast_kindsList", broadcast_kindsList);
        return "manager/broadcast/edit";//跳转到webApp目录下对应的JSP页面
    }

}
