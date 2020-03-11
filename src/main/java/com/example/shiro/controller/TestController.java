package com.example.shiro.controller;

import com.alibaba.fastjson.JSON;
import com.example.shiro.entity.User;
import com.example.shiro.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 吴成卓
 * @version V1.0
 * @Project: shiro
 * @Package com.example.shiro.controller
 * @Description:
 * @date 2020/3/5 星期四 18:25
 */
@Controller
public class TestController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes ra, Model model) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            return "redirect:index?username="+username;
        }catch (DisabledAccountException e){
            model.addAttribute("msg","账户被锁定，请联系超级管理员");
            token.clear();
            return "login";
        }catch (AuthenticationException e){
            model.addAttribute("msg","账号或密码错误");
            token.clear();
            return "login";
        }
    }

    /**
     * 退出
     * @return
     */
    @RequestMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }

    /**
     * 登录成功初始化内容
     * @return
     */
    @RequestMapping("/index")
    public String index(@RequestParam("username") String username,Model model) {
       Map<String,Object>map= userService.queryAll(username);
        model.addAttribute("map",map);
        model.addAttribute("username",username);
        return "index";
    }

    /**
     * 禁用权限
     * @return
     */
    @RequestMapping("/del/delById")
    @ResponseBody
    public String del(@RequestParam("id")Integer id){
          Map<String,Object>map=userService.delById(id);
        return JSON.toJSONString(map);
    }

    /**
     * 启用权限
     * @return
     */
    @RequestMapping("/updateStatus/updateStatusById")
    @ResponseBody
    public String updateStatus(@RequestParam("id")Integer id){
        Map<String,Object>map=userService.updateStatusById(id);
        return JSON.toJSONString(map);
    }

    /**
     * 添加权限
     * @return
     */
    @RequestMapping(value = "/add/addUser",method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(value="roles") Integer[] roles, User user){
       Map<String,Object>map= userService.add(user,roles);
        return JSON.toJSONString(map);
    }
    /**
     * 修改权限
     * @return
     */
    @RequestMapping(value = "/update/updateById",method = RequestMethod.POST)
    @ResponseBody
    public String update(User user){
        Map<String,Object>map= userService.updatePhoneById(user);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/400")
    @ResponseBody
    public String error(){
        Map<String,Object>map=new HashMap<>();
        map.put("msg","未授权");
        return JSON.toJSONString(map);
    }
}
