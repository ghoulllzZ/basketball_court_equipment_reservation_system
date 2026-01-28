package com.controller.front;

import com.entity.*;
import com.entity.Broadcast;
import com.entity.Broadcast_kinds;
import com.service.BroadcastService;
import com.service.Broadcast_kindsService;
import com.service.MembersService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller 基类
 */
@Controller
public class BaseFrontController {

    /* 日志 */
    protected final Log log = LogFactory.getLog(getClass());

    /* 获取基本环境 */
    public Map<String, String[]> getParameters() {// 封装为Map的requestParameters
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest().getParameterMap();
    }

    public HttpServletRequest getRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    public HttpSession getSession() {
        HttpSession session = null;
        try {
            session = this.getRequest().getSession();
        } catch (Exception e) {
        }
        return session;
    }


    @Autowired
    private MembersService membersService;
    @Autowired
    private Broadcast_kindsService broadcast_kindsService;
    // 注入Service 并getter setter
    @Autowired
    private BroadcastService broadcastService;

    // 公共方法 提供公共查询数据
    //不用再到每个方法里提取
    public void front() {
        Map<String, Object> parameter = new HashMap<String, Object>();
        getRequest().setAttribute("title", "篮球场实有人员动态监测信息网站");
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        this.getRequest().setAttribute("broadcast_kindsList", broadcast_kindsList);//分类列表


        Map<String, Object> parameter1 = new HashMap<String, Object>();
        parameter1.put("limit", 10);//搜索参数
        parameter1.put("start", 0);//搜索参数
        List<Broadcast> newList = broadcastService.getAll(parameter1);
        this.getRequest().setAttribute("newList", newList);//7条最新信息





    }


}
