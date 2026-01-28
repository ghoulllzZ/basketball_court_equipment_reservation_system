package com.controller.front;

import com.entity.Thinginfo;
import com.entity.Purchases;
import com.service.ClassifyinfoService;
import com.service.ThinginfoService;
import com.service.PurchasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class PurchasesFrontController extends BaseFrontController {


    @Autowired
    private ClassifyinfoService classifyinfoService;
    // 注入Service 并getter setter
    @Autowired
    private PurchasesService purchasesService;

    @Autowired
    private ThinginfoService thinginfoService;
    // 注入Service 并getter setter


    /*-----------------------------------------普通用户*/
    // 准备提交预约
    @RequestMapping("prePurchases.do")
    public String prePurchases(String id, Map<String, Object> map) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        Thinginfo thinginfo = thinginfoService.getById(id);
        map.put("thinginfo", thinginfo);
        return "members/addPurchases";//跳转到webApp目录下对应的JSP页面
    }

    // 提交预约
    @RequestMapping("addPurchases.do")
    public String addPurchases() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        String membersid = (String) this.getSession().getAttribute("userid");
        Purchases purchases = new Purchases();
        purchases.setAddtime(new Date());
        purchases.setThinginfoid(this.getRequest().getParameter("thinginfoid"));
        purchases.setMemo(this.getRequest().getParameter("memo"));
        purchases.setStatus("已预约");
        purchases.setMembersid(membersid);

        //创建SimpleDateFormat对象实例并定义好转换格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            // 注意格式需要与上面一致，不然会出现异常
            date = sdf.parse(this.getRequest().getParameter("purchase_time"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        purchases.setPurchase_time(date);
        purchasesService.insert(purchases);
        return "redirect:/front/myPurchases.do";//跳转到action
    }


    // 我的预约
    @RequestMapping("myPurchases.do")
    public String myPurchases(Map<String, Object> map) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/front/preLogin.do";//跳转到action
        }
        String membersid = (String) this.getSession().getAttribute("userid");
        Purchases purchases = new Purchases();
        purchases.setMembersid(membersid);
        List<Purchases> purchasesList = purchasesService.getByCond(purchases);
        map.put("purchasesList", purchasesList);
        return "members/myPurchases";//跳转到webApp目录下对应的JSP页面
    }


    // 取消预约
    @RequestMapping("cancel_line.do")
    public String cancel(String id, Map<String, Object> map) {
        this.front();
        Purchases purchases = purchasesService.getById(id);
        purchases.setStatus("取消");
        purchasesService.update(purchases);
        return "redirect:/front/myPurchases.do";//跳转到action
    }


    /*-----------------------------------------备用权限*/
    // 按备用权限ID显示数据
    @RequestMapping("getClassifyinfoPurchases.do")
    public String getClassifyinfoPurchases(HttpServletRequest request, Map<String, Object> map) {


        this.front();

        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        String membersid = (String) getRequest().getSession().getAttribute("userid");
        //获取包含的所有
        Map<String, Object> parameter11 = new HashMap<String, Object>();
        parameter11.put("classifyinfoid", membersid);//只显示当前的
        List<Thinginfo> thinginfoList = thinginfoService.getAll(parameter11);


        //只显示当前的 涉及的预约
        ArrayList thinginfoid_list111111 = new ArrayList<String>();
        for (int i = 0; i < thinginfoList.size(); i++) {
            Thinginfo thinginfo = (Thinginfo) thinginfoList.get(i);//转为MAP
            int id = thinginfo.getThinginfoid();//获取ID
            thinginfoid_list111111.add(String.valueOf(id));
        }
        parameter.put("thinginfoid_list", thinginfoid_list111111);


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
        return "classifyinfo/listpurchases_classifyinfo";//跳转到webApp目录下对应的JSP页面
    }


    // 完成预约
    @RequestMapping("over_line.do")
    public String over_line(String id, String status, Map<String, Object> map) throws UnsupportedEncodingException {
        this.front();
        Purchases purchases = purchasesService.getById(id);
        //// status = new String(status.getBytes("iso-8859-1"), "utf-8");//编码转换,防止乱码
        purchases.setStatus(status);
        purchasesService.update(purchases);
        return "redirect:/front/getClassifyinfoPurchases.do";//跳转到action
    }

}
