package com.infodance.infodancespringbootserver.module.user.repository;

import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;


@Mapper
public interface UserRepository {
    @Select("SELECT * FROM user")
    List<UserEntity> findAllUser();

    @Select("SELECT * FROM user WHERE id = #{id}")
    UserEntity findUserById(String  id);
}
