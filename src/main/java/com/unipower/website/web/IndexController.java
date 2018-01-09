package com.unipower.website.web;

import com.unipower.website.entity.Products;
import com.unipower.website.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by bjccdsrlcr on 2018/1/3.
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {
    @Autowired
    private ProductsService productsService;
    @RequestMapping("/indexPage")
    private String indexPage(HttpSession session){
//        if (session.getAttribute("userId") == null){
//            return "redirect:/login";
//        }
//        else {
//            return "index";
//        }
        return "index";
    }
    @RequestMapping("/indexPageShow")
    private String indexPageShow(HttpSession session, Model model){
//        if (session.getAttribute("userId") == null){
//            return "redirect:/login";
//        }
//        else {
//            return "index";
//        }
        List<Products> productsList = productsService.getProList();
        model.addAttribute("productsList", productsList);
        return "indexShow";
    }
}
