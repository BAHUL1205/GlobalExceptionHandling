package com.avizva.sevenstrings.globalexceptionhandler;

public class ServiceLayerException extends RuntimeException {

	public ServiceLayerException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public ServiceLayerException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public ServiceLayerException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
