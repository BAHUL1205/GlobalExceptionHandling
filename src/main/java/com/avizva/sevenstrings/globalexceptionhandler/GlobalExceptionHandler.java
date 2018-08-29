package com.avizva.sevenstrings.globalexceptionhandler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.BeanCreationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@ControllerAdvice
public class GlobalExceptionHandler {
	@Autowired
	ExceptionResponse error;// singeleton pattern

	private static Gson g;// using factory method
	private static ModelAndView m;

	public Gson getGson() {
		if (g == null) {
			g = new Gson();
		} else {
			return g;
		}
		return g;
	}

	public ModelAndView getModel(String s) {
		if (m == null) {
			m = new ModelAndView(s);
		} else {
			return m;
		}
		return m;
	}

	@ExceptionHandler
	public ModelAndView AccessDeniedException(AccesDeniedException e)// deninying
																		// any
																		// particular
																		// access
	{
		error.setErrormessage("AccesDenied");
		error.setStatus(HttpStatus.FORBIDDEN.value());
		String value = getGson().toJson(error);
		ModelAndView m1 = getModel("errorpage");
		m1.addObject(value);
		return m1;
	}

	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public ModelAndView handleError405(HttpServletRequest request, Exception e) {
		// mav.addObject("errorcode", "405");
		error.setErrormessage("Not A RequestedMethod");
		error.setStatus(HttpStatus.METHOD_FAILURE.value());
		String value = getGson().toJson(error);
		ModelAndView m1 = getModel("errorpage");
		m1.addObject("value", value);
		return m1;
	}

	@ExceptionHandler(DaoLayerException.class)
	public ModelAndView DaoLayerException() {// Dao Layer Exception
												// "405");
		error.setErrormessage("DAO Layer Exception");
		String value = getGson().toJson(error);
		ModelAndView m1 = getModel("errorpage");
		m1.addObject("value", value);
		return m1;
	}

	@ExceptionHandler(ServiceLayerException.class)
	public ModelAndView ServiceLayerException() {// service layer Exception,
													// "405");
		error.setErrormessage("Service Layer Exception");
		String value = getGson().toJson(error);
		ModelAndView m1 = getModel("errorpage");
		m1.addObject("value", value);
		return m1;
	}

	@ExceptionHandler(value = Exception.class) // Handling all the Exception
	public ModelAndView ServletException(Exception e) {
		e.printStackTrace();
		System.out.println("Exception occured" + e);
		return new ModelAndView("errorpage");
	}

	@ExceptionHandler(value = BeanCreationException.class) // Handling all the
															// // Exception
	public ModelAndView BeanCreation(BeanCreationException e) {
		e.printStackTrace();
		System.out.println("Exception occured" + e);
		return new ModelAndView("errorpage");
	}

	@ExceptionHandler(value = IllegalStateException.class) // Handling all the
															// // // Exception
	public ModelAndView Illegal(IllegalStateException e) {
		e.printStackTrace();
		System.out.println("Exception occured" + e);
		return new ModelAndView("errorpage");
	}

}
