package com.avizva.sevenstrings.globalexceptionhandler;

/**
 * @author Bahul.Diwan
 *
 */
public class AccesDeniedException extends RuntimeException {

	public AccesDeniedException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public AccesDeniedException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public AccesDeniedException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	

}
