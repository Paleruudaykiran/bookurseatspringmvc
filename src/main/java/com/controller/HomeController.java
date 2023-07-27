package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.dao.BusDao;
import com.dao.UserDao;
import com.entities.Bus;
import com.entities.User;

@Controller
public class HomeController {

	@Autowired
	ServletContext context;
	@Autowired
	BusDao busDao;
	@Autowired
	UserDao userDao;

	@RequestMapping("/home")
	public String home(Model m) {
		String page = "home";
		m.addAttribute("page", page);

		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list", list);
		return "home";
	}

	@RequestMapping("/add")
	public String addBus(Model m) {
		Bus bus = new Bus();
		String page = "add";
		m.addAttribute("page", page);
		m.addAttribute("bus", bus);
		return "home";
	}

	@RequestMapping(value = "/saveBus", method = RequestMethod.POST)
	public String saveBus(@ModelAttribute("bus") Bus bus, Model m) {
		String page = "home";
		m.addAttribute("page", page);
		this.busDao.save(bus);
		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list", list);
		return "home";
	}

	@RequestMapping(value = "/delete/{id}")
	public String deleteBus(@PathVariable("id") int id, Model m) {
		String page = "home";
		m.addAttribute("page", page);
		this.busDao.deleteById(id);
		List<Bus> list = this.busDao.getAll();
		m.addAttribute("list", list);
		return "redirect:/home";
	}

	@RequestMapping("/edit/{id}")
	public String editBus(@PathVariable("id") int id, Model model, RedirectAttributes redirectAttributes) {
		Bus bus = busDao.getById(id);
		model.addAttribute("bus", bus);

		redirectAttributes.addFlashAttribute("bus", bus);
		return "redirect:/editBus";
	}

	@RequestMapping("/editBus")
	public String showEditBusForm(@ModelAttribute("bus") Bus bus, Model model) {
		model.addAttribute("page", "edit");
//	    	System.out.println(bus.getId() + bus.getTravelsName());
		return "home";
	}

	@RequestMapping(value = "/updateBus", method = RequestMethod.POST)
	public String updateBus(@ModelAttribute("bus") Bus bus) {
		this.busDao.update(bus);
		return "redirect:/home";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam("ssource") String src, @RequestParam("sdestination") String dst, Model m) {
		List<Bus> list = this.busDao.getAll();
		System.out.println(src + " " + dst);
		List<Bus> filteredlis = new ArrayList<Bus>();
		if (src.equals("") && dst.equals("")) {
			m.addAttribute("list", list);
		} else if (src.equals("")) {
			for (Bus bus : list) {
				if (bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		} else if (dst.equals("")) {
			for (Bus bus : list) {
				if (bus.getBoards().equalsIgnoreCase(src)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		} else {
			for (Bus bus : list) {
				if (bus.getBoards().equalsIgnoreCase(src) && bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		}
		String page = "home";
		m.addAttribute("page", page);
		return "home";
	}

	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public String adminLogin(@RequestParam("uname") String name, @RequestParam("pass") String pass, Model m) {
		if (name.equalsIgnoreCase("uday") && pass.equals("123")) {
			String page = "home";
			m.addAttribute("page", page);

			List<Bus> list = this.busDao.getAll();
			m.addAttribute("list", list);
			return "home";
		}
		return "adminlogin";
	}

	@RequestMapping(value = "/adminloginpage")
	public String adminloginpage() {
		return "adminlogin";
	}
	@RequestMapping(value="loginpage")
	public String loginpage() {
		return "loginform";
	}
	@RequestMapping(value = "/register")
	public String register(Model m) {
		User user = new User();
		m.addAttribute(user);
		return "register";
	}

	@RequestMapping(value = "/saveUser")
	public String saveUser(@Valid @ModelAttribute("user") User u, BindingResult br) {
		if (br.hasErrors()) {
			List<ObjectError> errs = br.getAllErrors();
			for(ObjectError er : errs) {
				System.out.println(er);
			}
			return "register";
		}
		this.userDao.save(u);
		return "loginform";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String validateLogin(@RequestParam("uname") String uname, @RequestParam("pass") String pass, HttpSession session) {
		List<User> list = this.userDao.getAll();
		for (User u : list) {
			if (u.getName().equalsIgnoreCase(uname) && u.getPassword().equals(pass)) {
					session.setAttribute("loginuser", u);
					return "userhome";
			}
		}
		session.setAttribute("error", "Invalid username or password");
		return "loginform";
	}
	@RequestMapping(value="/logout",method = RequestMethod.GET) 
	public String logout(Model m) {
		return "redirect:/login";
	}
	@RequestMapping(value="usersearch")
	public String userSearch(@RequestParam("start") String src,@RequestParam("end") String dst,@ModelAttribute("uid") String uid, @ModelAttribute("uname") String uname,Model m) {
		System.out.println(uid + " " + uname);
		m.addAttribute("uid",uid);
		m.addAttribute("uname",uname);
		List<Bus> list = this.busDao.getAll();
		System.out.println(src + " " + dst);
		List<Bus> filteredlis = new ArrayList<Bus>();
		if (src.equals("") && dst.equals("")) {
			m.addAttribute("list", list);
		} else if (src.equals("")) {
			for (Bus bus : list) {
				if (bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		} else if (dst.equals("")) {
			for (Bus bus : list) {
				if (bus.getBoards().equalsIgnoreCase(src)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		} else {
			for (Bus bus : list) {
				if (bus.getBoards().equalsIgnoreCase(src) && bus.getStops().equalsIgnoreCase(dst)) {
					filteredlis.add(bus);
				}
			}
			m.addAttribute("list", filteredlis);
		}
		
		return "userhome";
	}
	@RequestMapping("/book/{id}")
	public String bookBus(@PathVariable("id") int id,HttpSession session) {
		Bus bus = busDao.getById(id);
		session.setAttribute("busDetails", bus);
		User user = (User) session.getAttribute("loginuser");
		session.setAttribute("loginuser", user);
		return "redirect:/booking";
	}
	@RequestMapping("/booking")
	public String booking(HttpSession session) {
		Bus bus = (Bus) session.getAttribute("busDetails");
		return "booking";
	}
	@RequestMapping("confirmbooking")
	public String confirmBooking(@RequestParam("seatsYouSelected") String seatnos,HttpSession session) {
		Bus bus = (Bus) session.getAttribute("busDetails");
		int ct = 1;
		for(int i=0;i<seatnos.length();i++) {
			if(seatnos.charAt(i) == ',') {
				ct+=1;
			}
		}
		int tprice = ct * (bus.getPrice());
		session.setAttribute("seatnos", seatnos);
		session.setAttribute("tprice", tprice);
		int pnr = (int) Math.floor(Math.random()*1000);
		session.setAttribute("pnr", pnr);
		return "bookingsuccess";
	}
}
