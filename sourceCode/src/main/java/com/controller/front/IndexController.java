package com.controller.front;

import com.entity.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class IndexController extends BaseFrontController {


    @Autowired
    private Broadcast_kindsService broadcast_kindsService;
    // 注入Service 并getter setter
    @Autowired
    private BroadcastService broadcastService;


    @Autowired
    private ThinginfoService thinginfoService;



    // 首页显示
    @RequestMapping("index.do")
    public String index(Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();
        List<Broadcast_kinds> broadcast_kindsList = broadcast_kindsService.getAll(parameter);
        List<Broadcast_kinds> frontList = new ArrayList<Broadcast_kinds>();
        for (Broadcast_kinds broadcast_kinds : broadcast_kindsList) {
            List<Broadcast> broadcastList = broadcastService.getByBroadcast_kinds(broadcast_kinds.getBroadcast_kindsid());
            broadcast_kinds.setBroadcastList(broadcastList);
            frontList.add(broadcast_kinds);
        }
        map.put("frontList", frontList);//按分类获取列表,用于首页显示所有分类的条目

        List<Broadcast> favList = broadcastService.getFlv();
        System.out.println(favList.size());

        map.put("favList", favList);//获取轮播的内容.用于首页显示
        List<Broadcast> topList = broadcastService.getTop();
        System.out.println(topList.size());

        map.put("topList", topList);//获取置顶的内容,用于首页显示





        //获取首场地器材信息
        Map<String, Object> parameter111 = new HashMap<String, Object>();
        parameter111.put("limit", 4);//搜索参数
        parameter111.put("start", 0);//搜索参数
        List<Thinginfo> thinginfoList = thinginfoService.getAll(parameter111);

        map.put("thinginfoList", thinginfoList);




        return "index";//跳转到webApp目录下对应的JSP页面
    }


}
