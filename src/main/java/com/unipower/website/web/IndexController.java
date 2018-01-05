package com.unipower.website.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by bjccdsrlcr on 2018/1/3.
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {
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
}
