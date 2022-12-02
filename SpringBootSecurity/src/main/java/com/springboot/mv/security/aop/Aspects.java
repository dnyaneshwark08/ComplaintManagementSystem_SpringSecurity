package com.springboot.mv.security.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Aspects {

	private static Logger logger= Logger.getLogger(Aspects.class);
	
	@Pointcut
	("execution(* com.springboot.mv.security.controller..*.*(..)) || execution(* com.springboot.mv.security.converter..*.*(..))||execution(*  com.springboot.mv.security.service..*.*(..))")
	public void poc() {
		
		//aspect log
	}
	
	//Adding Controller logger 
		@Around
		(value = "poc()")
		public Object intercept(ProceedingJoinPoint pjp) throws Throwable{

		    Signature name = pjp.getSignature();
		    try 
		    {
		        logger.info("started " + name);
		        Object obj = pjp.proceed();
		        logger.info("finished " + name + " successfully"); 
		        return obj;
		    } 
		    catch (Throwable t) {
		         logger.error(name + " finished with Exception - " + t.getMessage());
		         throw t;
		    } 
		    finally 
		    {
		     //empty for finally
		    }       
		}
	}
	

