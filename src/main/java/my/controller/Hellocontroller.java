package my.controller;

import my.service.HelloService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Hellocontroller {

@Autowired
private HelloService helloService;

@Autowired
private ByeController byeController;

@RequestMapping(value="/Welcome", method = RequestMethod.GET)
public String hello(ModelMap model){
	model.addAttribute("message", "hello World");
	
	return "hello";
}

@RequestMapping(value="/newteacher",method = RequestMethod.POST)
public @ResponseBody String saveteacher(@RequestBody Teacher teacher){
	
	
	return "Added";
}

	
	
}
