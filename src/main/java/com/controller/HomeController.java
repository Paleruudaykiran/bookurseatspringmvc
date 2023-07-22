package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.dao.BusDao;
import com.entities.Bus;

@Controller
public class HomeController {
	
	@Autowired
	ServletContext context;
	@Autowired
	BusDao busDao;
	
	@RequestMapping("/home")
	public String home(Model m) {
		String page = "home";
		m.addAttribute("page",page);
		
		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list",list);
		return "home";
	}
	
	@RequestMapping("/add")
	public String addTodo(Model m) {
		Bus bus = new Bus();
		String page = "add";
		m.addAttribute("page",page);
		m.addAttribute("bus",bus);
		return "home";
	}
	@RequestMapping(value="/saveBus", method=RequestMethod.POST)
	public String saveBus(@ModelAttribute("bus") Bus bus, Model m) {
		String page = "home";
		m.addAttribute("page",page);
		this.busDao.save(bus);
		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list",list);
		return "home";
	}
	@RequestMapping(value="/delete/{id}")
	public String deleteBus(@PathVariable("id") int id,Model m) {
		String page = "home";
		m.addAttribute("page",page);
		this.busDao.deleteById(id);
		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list",list);
		return "redirect:/home";
	}
	   @RequestMapping("/edit/{id}")
	    public String editBus(@PathVariable("id") int id, Model model, RedirectAttributes redirectAttributes) {
	        Bus bus = busDao.getById(id);
	        model.addAttribute("bus", bus);
	        
	        redirectAttributes.addFlashAttribute("bus",bus);
	        return "redirect:/editBus";
	    }
	    @RequestMapping("/editBus")
	    public String showEditBusForm(@ModelAttribute("bus") Bus bus, Model model) {
	    	model.addAttribute("page","edit");
//	    	System.out.println(bus.getId() + bus.getTravelsName());
	        return "home"; 
	    }
	 @RequestMapping(value = "/updateBus", method = RequestMethod.POST)
	 public String updateBus(@ModelAttribute("bus") Bus bus) {
	        this.busDao.update(bus);
	        
	        return "redirect:/home";
	    }
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam("ssource") String src, @RequestParam("sdestination") String dst,Model m) {
		List<Bus> list = this.busDao.getAll();
		System.out.println(src + " " + dst);
		List<Bus> filteredlis = new ArrayList<Bus>();
		if(src.equals("") && dst.equals("")) {
			m.addAttribute("list",list);
		}else if(src.equals("")) {
			for(Bus bus: list) {
				if(bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list",filteredlis);
		}else if(dst.equals("")) {
			for(Bus bus: list) {
				if(bus.getBoards().equalsIgnoreCase(src)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list",filteredlis);
		}else {
			for(Bus bus: list) {
				if(bus.getBoards().equalsIgnoreCase(src) && bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list",filteredlis);
		}
		String page = "home";
		m.addAttribute("page",page);
		return "home";
	}
	
}
