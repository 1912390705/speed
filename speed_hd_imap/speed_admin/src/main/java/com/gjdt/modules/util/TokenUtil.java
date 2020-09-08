package com.gjdt.modules.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.gjdt.modules.entity.Manager;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class TokenUtil {
    public static String getToken(Manager manager, HttpSession session) {
        Date start = new Date();
        long currentTime = System.currentTimeMillis() + 60* 60 * 1000;//一小时有效时间
        Date end = new Date(currentTime);
        String token = "";
        token = JWT.create().withAudience(String.valueOf(manager.getId())).withIssuedAt(start).withExpiresAt(end)
                .sign(Algorithm.HMAC256(manager.getPassword()));
        session.setAttribute(token,token);
        session.setMaxInactiveInterval(15*60);
        return token;
    }
    public static String getTokenManagerId() {
        String token = getRequest().getParameter("token");// 从 http 请求头中取出 token
        String managerId = JWT.decode(token).getAudience().get(0);
        return managerId;
    }


    public static HttpServletRequest getRequest() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        return requestAttributes == null ? null : requestAttributes.getRequest();
    }
}
