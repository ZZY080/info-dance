package com.infodance.infodancespringbootserver.common.interceptor;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.infodance.infodancespringbootserver.common.util.TokenUtil;
import com.infodance.infodancespringbootserver.module.user.entity.UserEntity;
import com.infodance.infodancespringbootserver.module.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class AuthenticationInterceptor implements HandlerInterceptor {
    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从http请求中取出token
        String accessToken = request.getHeader("accessToken");
        System.out.println("accessToken:" + accessToken);
        if (accessToken == null) {
            throw new RuntimeException("无token,请重新登录");
        }
        try {
            // 解码JWT并验证
            String userId = TokenUtil.verifyToken(accessToken);
            // 还可以检查token的有效性
            if (userId == null) {
                throw new RuntimeException("用户验证失败");
            }
            // 根据userId从数据库里查询用户信息
            UserEntity user = userService.getUserById(userId);
            request.setAttribute("user", user);
        } catch (JWTDecodeException e) {
            throw new RuntimeException("token无效");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}