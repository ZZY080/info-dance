package com.infodance.infodancespringbootserver.module.user.controller;
import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import com.infodance.infodancespringbootserver.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final RedisTemplate redisTemplate;

    @Autowired
    public UserController(UserService userService, RedisTemplate redisTemplate) {
        this.userService = userService;
        this.redisTemplate = redisTemplate;
    }


    @GetMapping
    public List<UserEntity> getUser() {
        return userService.getAllUser();
    }


    @GetMapping("/{id}")
    public UserEntity getUserById(@PathVariable String id, HttpServletRequest request) {
        UserEntity user = (UserEntity) request.getAttribute("user");
        System.out.println(user);
        this.redisTemplate.opsForValue().set("user" + id, "zzy");
        return userService.getUserById(id);
    }




}
