package com.avizva.sevenstrings.globalexceptionhandler;

import org.springframework.stereotype.Component;

@Component
public class ExceptionResponse {
	
	int status;
	String errormessage;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getErrormessage() {
		return errormessage;
	}
	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}
	public ExceptionResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}
