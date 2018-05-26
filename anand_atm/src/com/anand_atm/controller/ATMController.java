package com.anand_atm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.anand_atm.beans.DTHDetails;
import com.anand_atm.beans.Login;
import com.anand_atm.beans.MobileDetails;
import com.anand_atm.services.DTHDetailsService;
import com.anand_atm.services.MobileDetailsService;


@Controller
public class ATMController {
	
	@Autowired
	DTHDetailsService dthService;
	
	@Autowired
	MobileDetailsService mobileService;
	
	//When New Page(home.jsp) will Open It will Map to The Login Class With teh loginObj we have created Here.
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView getLoginPage() {
		return new ModelAndView("home","loginObj",new Login());
	}
	//When Login Button will press it fetch the data from loginObj which initially Created while Loading page
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView checkLoginData(@ModelAttribute("loginObj")Login login, BindingResult result ) {
		ModelAndView mv = new ModelAndView("details");
		if(result.hasErrors()) {
			return new ModelAndView("home");
		}else {
			//Check details
			System.out.println("Checking Loging Details");
			System.out.println(login.getPassword());
			System.out.println(login.getUsername());
			//dthService.getDetails();
			mv.addObject("username", login.getUsername());
		}
		return mv;
	}
	
	//DTH Page Call
	@RequestMapping(value="/dth", method=RequestMethod.GET)
	public ModelAndView getDTHDetails() {
		return new ModelAndView("dth","dthObj",new DTHDetails());
	}
	@RequestMapping(value="saveDth", method=RequestMethod.POST)
	public ModelAndView saveDTHDetails(@ModelAttribute("dthObj")DTHDetails dth, BindingResult result) {
		ModelAndView model = new ModelAndView("allDthList");
		if(result.hasErrors()) {
			return new ModelAndView("home");
		}else {
		model.addObject("dthNumber", dth.getDthNumber());
		dthService.newDthDetails(dth);
		return new ModelAndView("redirect:/dths");
//		model.setViewName("redirect:/mobiles");
//		
//		return model;
		
		}
	}
	
	//Mobile Page Call
	@RequestMapping(value="/mobile", method=RequestMethod.GET)
	public ModelAndView getMobileDetails() {
		return new ModelAndView("mobile","mobileObj",new MobileDetails());
	}
	@RequestMapping(value="saveMobile", method=RequestMethod.POST)
	public ModelAndView saveMobileDetails(@ModelAttribute("mobileObj")MobileDetails mobile, BindingResult result) {
		ModelAndView model = new ModelAndView("allMobileList");
		if(result.hasErrors()) {
			return new ModelAndView("home");
		}else {
		model.addObject("mobileNumber", mobile.getMobileNumber());
		mobileService.newMobileDetails(mobile);
		return new ModelAndView("redirect:/mobiles");
		//return model;
		}
	}
	@RequestMapping(value="/mobiles")
	public ModelAndView showMobileList() {
		ModelAndView model = new ModelAndView("allMobileList");
		List<MobileDetails> mobileList = mobileService.getMobileDetails();
		model.addObject("mobileList", mobileList);
		return model;
	}
	
	@RequestMapping(value="/dths")
	public ModelAndView showDthList() {
		ModelAndView model = new ModelAndView("allDthList");
		List<DTHDetails> dthList = dthService.getDTHDetails();
		model.addObject("dthList", dthList);
		return model;
	}
}
