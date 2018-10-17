package com.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.SourceLocation;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

//@Aspect
//@Component
public class MoneyAspect {

    @AfterReturning(value = "execution(* com.service.CustomerService.addCustomer(..))",returning = "re")
    public void bucketMoney(JoinPoint joinPoint, String re){

        if(re.equals("yes")){
            Object[] args = joinPoint.getArgs();
            HttpServletRequest request = (HttpServletRequest) args[0];

        }
    }
}
