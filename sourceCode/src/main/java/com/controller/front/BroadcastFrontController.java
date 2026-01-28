package com.controller.front;

import com.entity.Broadcast;
import com.service.BroadcastService;
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
@RequestMapping("/front")
public class BroadcastFrontController extends BaseFrontController {


    // 注入Service 并getter setter
    @Autowired
    private BroadcastService broadcastService;


    // 新闻通知
    @RequestMapping("broadcast.do")
    public String broadcast(HttpServletRequest request, Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();
        String broadcast_kindsid = request.getParameter("broadcast_kindsid");//搜索关键词
        String broadcastkeyword = request.getParameter("broadcastkeyword");//搜索关键词

        if (broadcast_kindsid != null && broadcast_kindsid != "") parameter.put("broadcast_kindsid", broadcast_kindsid);//搜索参数
        if (broadcastkeyword != null && broadcastkeyword != "") parameter.put("keyword", broadcastkeyword);//搜索参数


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

        map.put("broadcastkeyword", broadcastkeyword);
        map.put("broadcast_kindsid", broadcast_kindsid);
        map.put("pager", pager);
        map.put("broadcastList", broadcastList);
        return "broadcast";//跳转到webApp目录下对应的JSP页面
    }

    // 阅读公告
    @RequestMapping("broadcastDetail.do")
    public String broadcastDetail(String id, Map<String, Object> map) {
        this.front();
        Broadcast broadcast = broadcastService.getById(id);
        broadcast.setHits("" + (Integer.parseInt(broadcast.getHits()) + 1));
        broadcastService.update(broadcast);
        map.put("broadcast", broadcast);
        return "broadcastDetail";//跳转到webApp目录下对应的JSP页面
    }














}
