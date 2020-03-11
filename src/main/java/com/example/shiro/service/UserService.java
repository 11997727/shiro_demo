package com.example.shiro.service;

import com.example.shiro.entity.User;

import java.util.Map;

/**
 * @author 吴成卓
 * @version V1.0
 * @Project: shiro
 * @Package com.example.shiro.service
 * @Description:
 * @date 2020/3/5 星期四 22:19
 */
public interface UserService {

    User getUser(String username);

    Map<String, Object> queryAll(String username);

    Map<String, Object> add(User user,Integer[]roles);

    Map<String, Object> delById(Integer id);

    Map<String, Object> updatePhoneById(User user);

    Map<String, Object> updateStatusById(Integer id);
}
