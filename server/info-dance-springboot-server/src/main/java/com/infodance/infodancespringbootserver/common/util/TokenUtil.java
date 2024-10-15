package com.infodance.infodancespringbootserver.common.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class TokenUtil {

    public static final String secretKey = "hellokenny";
    public static final int tokenExpireTime = 10 * 1000;

    // 生成access token
    public static String generateAccessToken(UserEntity user) {
        Map<String, Object> map = new HashMap<>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        // 获取系统当前时间
        long now = System.currentTimeMillis();
        // 设置有效期
        long expireTime = now + tokenExpireTime;
        return JWT.create().withHeader(map).withClaim("userId", user.getId()).withExpiresAt(new Date(expireTime)).sign(Algorithm.HMAC256(secretKey));

    }

    // 生成refresh token
    public static String generateRefreshToken(UserEntity user) {
        Map<String, Object> map = new HashMap<>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        // 获取系统当前时间
        long now = System.currentTimeMillis();
        // 设置有效期
        long expireTime = now + tokenExpireTime;
        return JWT.create().withHeader(map).withClaim("userId", user.getId()).withExpiresAt(new Date(expireTime)).sign(Algorithm.HMAC256(secretKey));
    }

    // 验证token
    public static String verifyToken(String token) throws Exception {
//        String token = getRequest().getHeader("token");
        DecodedJWT jwt;
        try {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(secretKey)).build();
            jwt = verifier.verify(token);
            if (jwt.getExpiresAt().before(new Date())) {
                System.out.println("token 过期");
            }
        } catch (JWTVerificationException e) {
            System.err.println("jwt 验证失败：" + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("出现异常：" + e.getMessage());
            return null;
        }
        // 提取想要的内容
        return jwt.getClaim("userId").asString();

    }

    /**
     * 获取request
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return requestAttributes == null ? null : requestAttributes.getRequest();
    }
}
