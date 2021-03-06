package com.unipower.website.web;

import com.alibaba.fastjson.JSONObject;
import com.unipower.website.entity.Products;
import com.unipower.website.service.FileService;
import com.unipower.website.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    @Autowired
    private FileService fileService;
    //添加产品信息页面
    @RequestMapping(value = "/addProducts")
    private String addProductPage(){
        return  "addProduct";
    }

    @RequestMapping(value = "/addProductsData")
    @ResponseBody
    private Map addProductData(@RequestParam String SproductName, @RequestParam String SproductIntro,
                               @RequestParam MultipartFile Simg) throws Exception {
        Map<String, String> result = new HashMap<String, String>();
//        String pro_name = request.getParameter("pro_name");
//        String intro = request.getParameter("intro");
        //String file = request.getParameter("file");
        System.out.println(SproductName);
        System.out.println(SproductIntro);
        JSONObject params = new JSONObject();
        String url = fileService.upload(Simg, params);
        productsService.addProduct(SproductName, SproductIntro, url);
        result.put("result", "Success");
        result.put("message", "you have insert into a record successfully!");
        return result;
    }

    // 获得某一条新闻的详细信息页面
    @RequestMapping(value = "/productsId={productsId}/detail")
    private String productsDetail(@PathVariable("productsId") int productsId, Model model){
        Products products = productsService.getProById(productsId);
        model.addAttribute("products", products);
        return "product";
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

    @RequestMapping(value = "/getProductById")
    @ResponseBody
    private Products getProductById(HttpServletRequest request){
        int productsId = Integer.parseInt(request.getParameter("fid"));
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
    private Map updateProduct(HttpServletRequest request, @RequestParam MultipartFile img) throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        String pro_name = request.getParameter("productName");
        String intro = request.getParameter("productIntro");

        JSONObject params = new JSONObject();
        String url = fileService.upload(img, params);
        //int fid = Integer.parseInt(request.getParameter("fid"));
        productsService.updateProduct(pro_name, intro, 96, url);
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
