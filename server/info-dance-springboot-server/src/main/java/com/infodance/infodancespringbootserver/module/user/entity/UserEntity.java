package com.infodance.infodancespringbootserver.module.user.entity;

import lombok.Data;
@Data
public class UserEntity {
    private String id;
    private String username;
    private String password;
//    private Date birthday;
    private String email;
}
