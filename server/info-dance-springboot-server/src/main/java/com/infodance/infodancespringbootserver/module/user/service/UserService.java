package com.infodance.infodancespringbootserver.module.user.service;
import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import com.infodance.infodancespringbootserver.module.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    // 查询所有用户
    public List<UserEntity> getAllUser(){
        return userRepository.findAllUser();
    }

    // 查询单个用户
    public  UserEntity getUserById(String id){
        return userRepository.findUserById(id);
    }

}
