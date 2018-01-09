package com.unipower.website.web;

import com.unipower.website.entity.Products;
import com.unipower.website.entity.Solutions;
import com.unipower.website.service.ProductsService;
import com.unipower.website.service.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
@Controller
@RequestMapping(value = "/solutions")
public class SolutionController {
    @Autowired
    private SolutionService solutionService;


    @RequestMapping(value = "/addSolution")
    private String addProductPage(){
        return  "addProduct";
    }

    @RequestMapping(value = "/addSolutionData")
    @ResponseBody
    private Map addSolutionData(HttpServletRequest request){
        Map<String, String> result = new HashMap<String, String>();
        String sol_name = request.getParameter("sol_name");
        String intro = request.getParameter("intro");
        solutionService.addSolution(sol_name, intro);
        result.put("result", "Success");
        result.put("message", "you have insert into a record successfully!");
        return result;
    }


    @RequestMapping(value = "/solutionId={solutionId}/detail")
    private String SolutionsDetail(@PathVariable("solutionId") int solutionId, Model model){
        Solutions solutions = solutionService.getSolById(solutionId);
        model.addAttribute("solutions", solutions);
        return "solution_detail";
    }



    @RequestMapping(value = "/solutionShowList")
    private String solutionShowList(Model model){
        List<Solutions> solutionsList = solutionService.getSolList();
        model.addAttribute("solutionsList", solutionsList);
        return "solutionShowList";
    }

    @RequestMapping(value = "/solutionManageList")
    private String solutionManageList(Model model){
        List<Solutions> solutionsList = solutionService.getSolList();
        model.addAttribute("solutionsList", solutionsList);
        return "solutionManageList";
    }

    @RequestMapping(value = "/solutionListData")
    @ResponseBody
    private Map solutionListData(){
        List<Solutions> list = solutionService.getSolList();
        Map result = new HashMap();
        result.put("code", 200);
        result.put("data", list);
        return result;
    }

    @RequestMapping(value = "/getSolutionById")
    @ResponseBody
    private Solutions getSolutionById(HttpServletRequest request){
        int solutionId = Integer.parseInt(request.getParameter("fid"));
        return solutionService.getSolById(solutionId);
    }

    @RequestMapping(value = "/updateSolution")
    @ResponseBody
    private Map updateSolution(HttpServletRequest request){
        Map<String, String> result = new HashMap<String, String>();
        String sol_name = request.getParameter("sol_name");
        String intro = request.getParameter("intro");
        int fid = Integer.parseInt(request.getParameter("fid"));
        solutionService.updateSolution(sol_name, intro, fid);
        result.put("result", "Success");
        result.put("message", "you have update a record successfully!");
        return result;
    }

    @RequestMapping(value = "/deleteSolution")
    @ResponseBody
    private Map deleteProduct(HttpServletRequest request){
        int fid = Integer.parseInt(request.getParameter("fid"));
        solutionService.deleteSolution(fid);
        Map result = new HashMap();
        result.put("code", 200);
        result.put("result", "success");
        result.put("solutionId", "被删除的解决方案ID是"+fid);
        return result;
    }

}
