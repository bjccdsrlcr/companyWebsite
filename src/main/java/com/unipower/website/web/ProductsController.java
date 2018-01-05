package com.unipower.website.web;

import com.unipower.website.entity.Products;
import com.unipower.website.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/2.
 */
@Controller
@RequestMapping(value = "/products")
public class ProductsController {
    @Autowired
    private ProductsService productsService;

    //添加产品信息页面
    @RequestMapping(value = "/addProducts")
    private String addProductPage(){
        return  "addProduct";
    }
    @RequestMapping(value = "/addProductsData")
    @ResponseBody
    private Map addProductData(HttpServletRequest request){
        Map<String, String> result = new HashMap<String, String>();
        String pro_name = request.getParameter("pro_name");
        String intro = request.getParameter("intro");
        productsService.addProduct(pro_name, intro);
        result.put("result", "Success");
        result.put("message", "you have insert into a record successfully!");
        return result;
    }

    // 获得某一条新闻的详细信息页面
    @RequestMapping(value = "/productsId={productsId}/detail", method = RequestMethod.GET)
    private String productsDetail(@PathVariable("productsId") int productsId, Model model){
        //如果没有传值，进行重定向处理
        if (productsId == 0){
            return "redirect:/news/add";
        }
        Products products = productsService.getProById(productsId);
        model.addAttribute("products", products);
        return "productsDetail";
    }



    @RequestMapping(value = "/productList")
    private String newsList(Model model){
        return "productList";
    }

    @RequestMapping(value = "/productListData")
    @ResponseBody
    private Map productListData(){
        List<Products> list = productsService.getProList();
        Map result = new HashMap();
        result.put("code", 200);
        result.put("data", list);
        //result.put("typeList", typeList);
        return result;
    }

    @RequestMapping(value = "/getProductById", method = RequestMethod.GET)
    @ResponseBody
    private Products getProductById(int productsId){
        //
        //
        // 怎么拿到ID值
        return productsService.getProById(productsId);
    }

    @RequestMapping(value = "/getProductByName")
    @ResponseBody
    private Products getProductByName(HttpServletRequest request){
        String pro_name = request.getParameter("pro_name");
        return productsService.getProByName(pro_name);
    }

    @RequestMapping(value = "/updateProduct")
    @ResponseBody
    private Map updateProduct(HttpServletRequest request){
        Map<String, String> result = new HashMap<String, String>();
        String pro_name = request.getParameter("pro_name");
        String intro = request.getParameter("intro");
        int fid = Integer.parseInt(request.getParameter("pro_id"));
        productsService.updateProduct(pro_name, intro, fid);
        result.put("result", "Success");
        result.put("message", "you have update a record successfully!");
        return result;
    }

    @RequestMapping(value = "/deleteProduct")
    @ResponseBody
    private Map deleteProduct(HttpServletRequest request){
        int fid = Integer.parseInt(request.getParameter("fid"));
        productsService.deleteProduct(fid);
        Map result = new HashMap();
        result.put("code", 200);
        result.put("result", "success");
        result.put("productID", "被删除的新闻ID是"+fid);
        return result;
    }
    //更新产品是否发布的信息
    @RequestMapping(value = "/isPub")
    @ResponseBody
    public Map updateNewsIsPub(HttpServletRequest request){
        String id = request.getParameter("productsId");
        int productsId = Integer.parseInt(id);
        productsService.updateProductIsPub(productsId);
        Products products = productsService.getProById(productsId);
        System.out.println("after" + products.isIs_pub());
        boolean isPub = products.isIs_pub();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("result", "success");
        result.put("isPub", isPub);
        result.put("productsId", productsId);
        result.put("description", "当isPub为true时，表示当前产品为已发布状态;当isPub为false时，表示当前产品为未发布状态");
        return result;
    }

    //更新产品是否热门的信息
    @RequestMapping(value = "/isHot")
    @ResponseBody
    public Map updateNewsIsHot(HttpServletRequest request){
        String id = request.getParameter("productsId");
        int productsId = Integer.parseInt(id);
        productsService.updateProductIsHot(productsId);
        Products products = productsService.getProById(productsId);
        System.out.println("after" + products.isIs_hot());
        boolean isHot = products.isIs_hot();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("result", "success");
        result.put("isHot", isHot);
        result.put("productsId", productsId);
        result.put("description", "当isHot为true时，表示当前产品为热门;当isPub为false时，表示当前产品不是热门产品");
        return result;
    }
}
