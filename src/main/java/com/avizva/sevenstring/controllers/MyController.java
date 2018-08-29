package com.avizva.sevenstring.controllers;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.avizva.sevenstrings.globalexceptionhandler.AccesDeniedException;

@Controller
public class MyController {

	@RequestMapping("/")
	public ModelAndView getHome() {
		ModelAndView mv = new ModelAndView("Home");
		return mv;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin() {
		int id = 1;
		if (id == 1)
			throw new AccesDeniedException("Admin not found " + id);
		return new ModelAndView();

	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView adin() throws SQLException {
		int id = 1;
		if (id == 1)
			throw new AccesDeniedException("Admin not found " + id);
		else

			return new ModelAndView();

	}

}
