package employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {

	static final String ADMIN_USERNAME = "project_lead";
	static final String ADMIN_PASSWORD = "root1234";

	@GetMapping(value = { "/" })
	public String home() {
		return "01_index";
	}

	@GetMapping("/leadlogin")
	public String leadlogin() {
		return "02_leadlogin";
	}

	@GetMapping("/associatelogin")
	public String associatelogin() {
		return "03_associatelogin";
	}

	@RequestMapping(value = "/leadview", method = RequestMethod.POST)
	public String checkLeadLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request) {

		if (username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD)) {

			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			return "04_leadview";
		} else {
			model.addAttribute("error", "Invalid credentials");
			return "02_leadlogin";
		}

	}

	@GetMapping(value = { "/index" })
	public String mainpage() {
		return "01_index";
	}

	@GetMapping(value = { "/leadview" })
	public String leadpage() {
		return "04_leadview";
	}

	@GetMapping(value = { "/associateview" })
	public String associatepage() {
		return "05_associateview";
	}

}
