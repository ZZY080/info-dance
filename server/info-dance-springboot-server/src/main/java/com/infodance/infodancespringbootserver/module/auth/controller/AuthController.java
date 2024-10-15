package com.infodance.infodancespringbootserver.module.auth.controller;


import com.infodance.infodancespringbootserver.common.util.TokenUtil;
import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import com.infodance.infodancespringbootserver.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;

    @Autowired
    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public Object login() {
        UserEntity user = this.userService.getUserById("2");
        // 构造返回JSON数据
        Map<String,Object> response=new HashMap<>();
        response.put("accessToken", TokenUtil.generateAccessToken(user));
        response.put("user",user);
        return ResponseEntity.ok(response);
    }



}
