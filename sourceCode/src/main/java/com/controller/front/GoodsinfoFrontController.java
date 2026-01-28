package com.controller.front;

import com.entity.Goodsinfo;
import com.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class GoodsinfoFrontController extends BaseFrontController {
    // 注入Service 并getter setter
    @Resource
    private GoodsinfoService goodsinfoService;


    // 显示全部数据//审核过的
    @RequestMapping("goodsinfo.do")
    public String goodsinfo(HttpServletRequest request, Map<String, Object> map) throws UnsupportedEncodingException {
        this.front();

        Map<String, Object> parameter = new HashMap<String, Object>();
        String goodsinfokeyword = request.getParameter("goodsinfokeyword");//搜索关键词
        if (goodsinfokeyword != null && goodsinfokeyword != "") {

            //goodsinfokeyword = new String(goodsinfokeyword.getBytes("iso-8859-1"), "utf-8");//编码转换,防止乱码
            parameter.put("keyword", goodsinfokeyword);//搜索参数
        }


        parameter.put("iscooled", 0);//交易成功的
        parameter.put("status", 0);//上架成功的

        int rowCountTotal = goodsinfoService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数



        /*String posts_keyword = request.getParameter("posts_keyword");//前端发送来的 会员的
        if (posts_keyword != null && posts_keyword != "") {
            posts_keyword = new String(posts_keyword.getBytes("iso-8859-1"), "utf-8");//编码转换,防止乱码
            //分词然后去数据库查询
            List<String> posts_keyword_list = MyWordSegmenter.seg(posts_keyword);
            parameter.put("posts_keyword_list", posts_keyword_list);//搜索参数
            map.put("posts_keyword_list", posts_keyword_list);//分词结果 给前台显示


            parameter.put("limit", 1000);//搜索参数,前台不用分页,这里预设1000取数量


        }*/


        List<Goodsinfo> goodsinfoList = goodsinfoService.getAll(parameter);


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

        map.put("goodsinfokeyword", goodsinfokeyword);
        map.put("pager", pager);


        map.put("goodsinfoList", goodsinfoList);

        return "goodsinfo";//跳转到webApp目录下对应的JSP页面
    }


    // 按主键查询数据
    @RequestMapping("goodsinfoDetail.do")
    public String goodsinfoDetail(HttpServletRequest request, String id, Map<String, Object> map) throws UnsupportedEncodingException {
        this.front();

        //Map<String, Object> parameter = new HashMap<String, Object>();
        Goodsinfo goodsinfo = goodsinfoService.getById(id);


        map.put("goodsinfo", goodsinfo);//////商品详情


        return "goodsinfoDetail";//跳转到webApp目录下对应的JSP页面

    }


}
