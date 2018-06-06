package com.jachin.shopping.controller;

import com.jachin.shopping.bean.Msg;
import com.jachin.shopping.po.User;
import com.jachin.shopping.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    private UserService userService = new UserService();

    @RequestMapping("/home")
    public String loginSuccess(){
        return "home";
    }

    // 用户登陆
    @RequestMapping("/home2")
    @ResponseBody
    public Msg login(User user, HttpSession httpSession){
        int userId = userService.login(user);
        if(userId==-1){
            return Msg.fail();
        }else{
            httpSession.setMaxInactiveInterval(-1);
            httpSession.setAttribute("userId",userId);
            return Msg.success();
        }
    }

    // 用户查看信息
    @RequestMapping(value = "/user",method = RequestMethod.GET)
    @ResponseBody
    public Msg getUserInfo(HttpSession session){
        int userId = (int) session.getAttribute("userId");
        User userInfo = userService.getUserInfo(userId);
        return Msg.success().add("userInfo",userInfo);
    }

    // 用户修改信息
    @RequestMapping(value = "/user",method = RequestMethod.PUT)
    @ResponseBody
    public Msg editUserInfo(User user, HttpSession session){
        int userId = (int) session.getAttribute("userId");
        user.setUserid(userId);
        userService.editUserInfo(user);
        return Msg.success();
    }
}
