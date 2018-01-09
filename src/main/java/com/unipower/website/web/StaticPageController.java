package com.unipower.website.web;

import com.unipower.website.entity.News;
import com.unipower.website.entity.Products;
import com.unipower.website.entity.Solutions;
import com.unipower.website.service.NewsService;
import com.unipower.website.service.ProductsService;
import com.unipower.website.service.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 * // 网站还是存在静态页面，这里提供路由给他们进行跳转
 */
@Controller
public class StaticPageController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private ProductsService productsService;
    @Autowired
    private SolutionService solutionService;
    @RequestMapping("/main")
    public String main(Model model){
        List<News> newsPubList = newsService.getPubNews();
        List<Products> productsList = productsService.getProList();
        List<Solutions> solutionsList = solutionService.getSolList();
        Solutions solutions = solutionsList.get(0);
        solutionsList.remove(0);
        int listSize = solutionsList.size();
        model.addAttribute("newsPubList", newsPubList);
        model.addAttribute("productsList", productsList);
        model.addAttribute("solutions", solutions);
        model.addAttribute("solutionsList", solutionsList);
        model.addAttribute("listSize", listSize);
        return "main";
    }

    // 该路由出于无奈之举写出，因为不知道前端的${}变量如何成功写入jsp的表达式中，只好出此下策通过js拿到长度，再渲染到页面上。
    @RequestMapping("/getSolutionSize")
    @ResponseBody
    public Map getSolutionSize(){
        List<Solutions> solutionsList = solutionService.getSolList();
        int listSize = solutionsList.size()-1;
        Map result = new HashMap();
        result.put("size", listSize);
        return result;
    }
    @RequestMapping("/talent")
    public String talent(Model model){
        return "talent";
    }
    @RequestMapping("/honour")
    public String honour(Model model){
        return "honour";
    }
    @RequestMapping("/idea")
    public String idea(Model model){
        return "idea";
    }
    @RequestMapping("/service")
    public String service(Model model){
        return "service";
    }
    @RequestMapping("/job")
    public String job(Model model){
        return "job";
    }
}
