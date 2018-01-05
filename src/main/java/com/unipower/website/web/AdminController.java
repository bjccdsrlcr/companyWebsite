package com.unipower.website.web;

import com.alibaba.fastjson.JSONObject;
import com.unipower.website.entity.Admin;
import com.unipower.website.service.AdminService;
import com.unipower.website.util.Hex;
import com.unipower.website.util.RSAUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.KeyPair;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Date;
import java.util.Map;

/**
 * Created by bjccdsrlcr on 2017/12/27.
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login")
    private String login(Model model){
        return "login1";
    }


    @RequestMapping(value = "/loginData")
    private String loginData(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username+"====="+password);
        Admin admin = adminService.verifyAdmin(username, password);
        if(admin != null){
            HttpSession session = request.getSession();
            String sessionID = session.getId();
            session.setAttribute("sessionID", sessionID);
            session.setAttribute("username", username);
            return "redirect:/news/newsList";
        }else {
            return "redirect:/news/news";
        }
    }

    @RequestMapping(value = "/getRSAPublicKey", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getRSAPublicKey(HttpServletRequest request) throws Exception {
        JSONObject result = new JSONObject();
        KeyPair kp = RSAUtil.generateKeyPair();
        RSAPublicKey pubk = (RSAPublicKey) kp.getPublic();// 生成公钥
        RSAPrivateKey prik = (RSAPrivateKey) kp.getPrivate();// 生成私钥
        String publicKeyExponent = pubk.getPublicExponent().toString(16);// 16进制
        String publicKeyModulus = pubk.getModulus().toString(16);// 16进制
        request.getSession().setAttribute("prik", prik);
        result.put("pubexponent", publicKeyExponent);
        result.put("pubmodules", publicKeyModulus);
        return result;
    }

    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login2(HttpServletRequest request, HttpSession session) throws Exception {
        JSONObject result = new JSONObject();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        byte[] username_en_result = Hex.hexStringToBytes(username);
        byte[] password_en_result = Hex.hexStringToBytes(password);

        //解密
        byte[] username_de_result = RSAUtil.decrypt(RSAUtil.getKeyPair().getPrivate(), username_en_result);
        byte[] password_de_result = RSAUtil.decrypt(RSAUtil.getKeyPair().getPrivate(), password_en_result);

        StringBuffer sb2 = new StringBuffer();
        sb2.append(new String(username_de_result));
        String usr = sb2.reverse().toString();


        StringBuffer sb1 = new StringBuffer();
        sb1.append(new String(password_de_result));
        String pwd = sb1.reverse().toString();
        Admin admin = adminService.findAdminByName(usr);
        // 登录成功，将用户信息存入session 并且返回给js
        if (admin != null && admin.getPassword().equals(pwd) && admin.getUser_name().equals(usr)) {
            String sessionID = session.getId();
            session.setAttribute("sessionID", sessionID);
            System.out.println("sessionId" + session);
            session.setAttribute("userId", admin.getFid());
            session.setAttribute("username", admin.getUser_name());
            session.setAttribute("lastLoginTime", new Date());
            session.setAttribute("priId", admin.getPri_id());
            result.put("result", "1");
            result.put("desc", "Login success");
            return result;
        }else {
            result.put("result", "0");
            result.put("desc", "Login failed");
            return result;
        }
    }
}
