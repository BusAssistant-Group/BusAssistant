package com.busasst.controller;

import com.busasst.dao.RouteDao;
import com.busasst.dao.UserDao;
import com.busasst.entity.AdminEntity;
import com.busasst.entity.RouteEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by tsj on 16-8-10.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("routeDao")
    private RouteDao routeDao;

    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;



    @RequestMapping(value = "/changetoregist", method = RequestMethod.GET)
    public String changeToRegist() {
        return "regist";
    }

    @RequestMapping(value = "/changetologin", method = RequestMethod.GET)
    public String changeToLogin() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)           //调用post方法
    public String login(HttpServletRequest request, String username,
                        String password, String codenum,HttpSession session) {
        int status = 0;
        System.out.println("userController:\n username:" + username + " password: " + password);
        String usernmaemessage = new String();
        String passwordmessage = new String();
        String codemessage = new String();

        if (username.isEmpty()) {
            usernmaemessage = "请输入用户名";
        } else {
            AdminEntity user = userDao.getByName(username);
            if(user==null){
                usernmaemessage = "不存在的用户！";
            }
            else if (password.isEmpty()) {
                passwordmessage = "请输入密码";
            } else if (!user.getPassword().equals(password)) {
                passwordmessage = "密码错误";
            }
            else if(!codenum.equalsIgnoreCase(session.getAttribute("code").toString())){
                codemessage = "验证码错误";
            }
            else {
                status = 1;
                usernmaemessage = "用户登陆成功";
                session.setAttribute("loginUser", user);
                session.setAttribute("userid",user.getAdminId());
                System.out.println("message1 : " + usernmaemessage);
                request.getSession().setAttribute("username", username);
                System.out.println("message : " + usernmaemessage);



               // if(user.getAuthority().equals("1"))return "redirect:/admin/index";
                return "cars-mng";
            }
        }
        session.setAttribute("usernmaemessage",usernmaemessage);
        session.setAttribute("passwordmessage",passwordmessage);
        session.setAttribute("codemessage",codemessage);

        System.out.println("usernmaemessage : " + usernmaemessage);
        System.out.println("passwordmessage : " + passwordmessage);
        System.out.println("codemessage : " + codemessage);

        return "redirect:/login";
    }


    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public String regist(HttpSession httpSession, String username, String password, String password2) {
        String reusernmaemessage = new String();
        String repasswordmessage = new String();
        String recodemessage = new String();

        if (username.isEmpty()) {
            reusernmaemessage = "请输入用户名";
        } else if (password.isEmpty()) {
            repasswordmessage = "请输入密码";
        } else {
            if (!password.equals(password2)) {
                recodemessage = "请保持密码和确认密码一致！";
            } else {
                AdminEntity testuser = userDao.getByName(username);
                if(testuser==null){
                    userDao.save(username, password);
                    httpSession.setAttribute("loginUser",testuser);
                    System.out.println("UserController : "+username);
                    httpSession.setAttribute("username",username);
                    return "cars-mng";
                } else{
                    reusernmaemessage = "已经存在的用户名！";
                }
            }
        }
        httpSession.setAttribute("reusernmaemessage",reusernmaemessage);
        httpSession.setAttribute("repasswordmessage",repasswordmessage);
        httpSession.setAttribute("recodemessage",recodemessage);
        System.out.println("UserController : "+username);
        httpSession.setAttribute("username",username);

        System.out.println("reusernmaemessage:" + reusernmaemessage);
        System.out.println("repasswordmessage:" + repasswordmessage);
        System.out.println("recodemessage:" + recodemessage);

        return "redirect:/user/changetoregist";
//        return "redirect:/index";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "redirect:/index";
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "lineManage";
    }

    @RequestMapping(value = "/linestation", method = RequestMethod.GET)
    public String test2(Model model) {
        List<RouteEntity> routes = routeDao.getAllRoutes();
        model.addAttribute("routes",routes);
        return "line-map";
    }
}
