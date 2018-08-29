package com.avizva.sevenstrings.utils;

import com.google.gson.Gson;

public class Utils {

	private static Gson g;// using factory method

	public static Gson getGson() {
		if (g == null) {
			g = new Gson();
		} else {
			return g;
		}
		return g;
	}

}
