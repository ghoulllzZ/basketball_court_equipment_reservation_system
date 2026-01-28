package com.controller.manager;

import com.entity.Classifyinfo;
import com.entity.Purchases;
import com.entity.Thinginfo;
import com.entity.Members;
import com.service.ClassifyinfoService;
import com.service.PurchasesService;
import com.service.ThinginfoService;
import com.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/purchases")
public class PurchasesController extends BaseManagerController {
    // 注入Service
    @Autowired
    private PurchasesService purchasesService;
    @Autowired
    private MembersService membersService;
    @Autowired
    private ClassifyinfoService classifyinfoService;

    @Autowired
    private ThinginfoService thinginfoService;


    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String deletePurchases(String id) {
        purchasesService.delete(id);
        return "redirect:/manager/purchases/getAll.do";//跳转到action
    }


    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        int rowCountTotal = purchasesService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Purchases> purchasesList = purchasesService.getAll(parameter);


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

        map.put("purchasesList", purchasesList);
        return "manager/purchases/list";//跳转到webApp目录下对应的JSP页面
    }


    // 完成
    @RequestMapping("over.do")
    public String over(String id, String status, Map<String, Object> map) throws UnsupportedEncodingException {

        Purchases purchases = purchasesService.getById(id);
        //// status = new String(status.getBytes("iso-8859-1"), "utf-8");//编码转换,防止乱码
        purchases.setStatus(status);
        purchasesService.update(purchases);

        Thinginfo thinginfo = thinginfoService.getById(purchases.getThinginfoid());


        return "redirect:/manager/purchases/getAll.do";//跳转到action
    }

    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getPurchasesById(String id, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        Purchases purchases = purchasesService.getById(id);
        map.put("purchases", purchases);
        List<Members> membersList = membersService.getAll(parameter);
        map.put("membersList", membersList);
        List<Classifyinfo> classifyinfoList = classifyinfoService.getAll(parameter);
        map.put("classifyinfoList", classifyinfoList);
        return "manager/purchases/edit";//跳转到webApp目录下对应的JSP页面
    }


}
