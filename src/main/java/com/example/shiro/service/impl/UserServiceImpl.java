package com.example.shiro.service.impl;

import com.example.shiro.entity.User;
import com.example.shiro.mapper.RoleMapper;
import com.example.shiro.mapper.UserMapper;
import com.example.shiro.service.UserService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 吴成卓
 * @version V1.0
 * @Project: shiro
 * @Package com.example.shiro.service.impl
 * @Description:
 * @date 2020/3/5 星期四 22:20
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public User getUser(String username){

       return userMapper.selectUserByUserName(username);
    }

    @Override
    public Map<String, Object> queryAll(String username) {
        Map<String,Object>map=new HashMap<>();
        map.put("code",2004);
        List<User>list=userMapper.selectAll(username);
        if(list!=null&&list.size()>0){
            map.put("code",2001);
            map.put("data",list);
        }
        return map;
    }

    @Override
    public Map<String, Object> add(User user, Integer[]roles) {
        //第二个参数指定用户名作为盐
        Sha256Hash sha256Hash = new Sha256Hash(user.getPassword(), user.getUsername(), 1024);
        //密码采用base64格式化
        user.setPassword(sha256Hash.toBase64());
        Map<String,Object>map=new HashMap<>();
        map.put("code",2004);
        map.put("msg","failed");
        Integer integer = userMapper.add(user);
        if(integer>0){
           Integer num= roleMapper.addUserRoles(user.getId(),roles);
            if(num>0){
                map.put("code",2001);
                map.put("msg","success");
            }
        }
        return map;
    }

    @Override
    public Map<String, Object> delById(Integer id) {
        Map<String,Object>map=new HashMap<>();
        map.put("code",2004);
        map.put("msg","failed");
       Integer integer= userMapper.updateUserStatus(id);
       if(integer>0){
           map.put("code",2001);
           map.put("msg","success");
       }
        return map;
    }

    @Override
    public Map<String, Object> updatePhoneById(User user) {
        Map<String,Object>map=new HashMap<>();
        map.put("code",2004);
        map.put("msg","failed");
        Integer integer= userMapper.updatePhoneById(user);
        if(integer>0){
            map.put("code",2001);
            map.put("msg","success");
        }
        return map;
    }

    @Override
    public Map<String, Object> updateStatusById(Integer id) {
        Map<String,Object>map=new HashMap<>();
        map.put("code",2004);
        map.put("msg","failed");
        Integer integer= userMapper.updateStatusById(id);
        if(integer>0){
            map.put("code",2001);
            map.put("msg","success");
        }
        return map;
    }
}
