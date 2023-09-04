package employee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import employee.dao.EmployeeDao;
import employee.dao.ProjectDao;
import employee.entities.Employee;
import employee.entities.Project;
import employee.exceptions.ForeignKeyException;

@Controller
public class LeadFormController {

	@Autowired
	EmployeeDao employeeDao;

	@Autowired
	ProjectDao projectDao;

	@RequestMapping("/addassociateform")
	public String gotoTraineeForm() {
		return "addassociate";

	}

	@RequestMapping("/addprojectform")
	public String gotoProjectForm() {

		return "addproject";
	}

	@GetMapping("/leadlogout")
	public String processLogout(HttpSession session, Model attr) {

		session.getAttribute("employeeRegistered");
		session.invalidate();
		attr.addAttribute("result", "Logged out successfully");
		return "02_leadlogin";
	}

	@RequestMapping(value = "/addassociateform", method = RequestMethod.POST)
	public String handleAssociateForm(@RequestParam("name") String name, @RequestParam("id") String id,
			@RequestParam("username") String username, @RequestParam("createPassword") String password,
			@RequestParam("reEnterPassword") String rePassword, @RequestParam("leadid") String leadid,
			@RequestParam("role") String role, @RequestParam("projectTitle") String projectTitle,
			@RequestParam("description") String description, Model model) {

		Employee employee = new Employee();
		try {
			if (password.equals(rePassword)) {
				employee.setName(name);
				employee.setId(id);
				employee.setUserName(username);
				employee.setPassword(password);
				employee.setLeadId(leadid);
				employee.setRole(role);
				employee.setProjectTitle(projectTitle);
				employee.setDescription(description);
				int result = employeeDao.insertEmployee(employee);
				if (result > 0) {
					model.addAttribute("success", "Employee Added Successfully");
					return "04_leadview";
				} else {
					model.addAttribute("success", "Employee Addition failed");
					return "04_leadview";
				}
			} else {
				model.addAttribute("error", "Please check the password!");
				return "04_leadview";
			}
		} catch (DataAccessException de) {
			model.addAttribute("error", "Please check the details");
			de.printStackTrace();
			return "04_leadview";
		}

	}

	@RequestMapping(value = "/addproject", method = RequestMethod.POST)
	public String handleProjectForm(@RequestParam("pname") String pname,
			@RequestParam("pdescription") String pdescription, @RequestParam("lname") String leadname,
			@RequestParam("sdate") int duration, Model model) {
		try {
			Project project = new Project();
			project.setProjectName(pname);
			project.setProjectDesc(pdescription);
			project.setLeadName(leadname);
			project.setDuration(duration);
	
			int result = projectDao.insertProject(project);
			if (result > 0) {

			}
			return "04_leadview";
		} catch (ForeignKeyException fke) {
			model.addAttribute("error", "Please check the username");
			fke.printStackTrace();
			return "addproject";
		}
	}

	@RequestMapping(value = { "/viewAssociateTable" })
	public String viewEmployees(Model model) {
		List<Employee> listOfEmployees = employeeDao.showData();
		

		model.addAttribute("listOfEmployees", listOfEmployees);
		return "associatetable";

	}

	@RequestMapping(value = { "/viewProjectTable" })
	public String viewProjects(Model model) {
		List<Project> listOfProjects = projectDao.showProject();


		model.addAttribute("listOfProjects", listOfProjects);
		return "projecttable";

	}

	@RequestMapping("/openUpdateEmployeePage/{empId}")
	public String openUpdateEmployeePage(@PathVariable("empId") int empId, Model model) {
		Employee employeeToUpdate = employeeDao.getEmployee(empId);
		model.addAttribute("employeeToUpdate", employeeToUpdate);

		return "associate_update";
	}

	@RequestMapping("/update/{empId}")
	public ModelAndView updateEmployeeRequest(@RequestParam("name") String name, @RequestParam("id") String id,
			@RequestParam("createPassword") String password, @RequestParam("leadid") String leadid,
			@RequestParam("role") String role, @RequestParam("projectTitle") String projectTitle,
			@RequestParam("description") String description, @PathVariable("empId") int empId,
			RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		Employee employee = new Employee();
		employee.setEmpId(empId);
		employee.setName(name);
		employee.setId(id);
		employee.setPassword(password);
		employee.setLeadId(leadid);
		employee.setRole(role);
		employee.setProjectTitle(projectTitle);
		employee.setDescription(description);
		try {
			int result = employeeDao.updateEmployee(employee);
			if (result > 0) {
				List<Employee> listOfEmployees = employeeDao.showData();
				redirectAttributes.addFlashAttribute("listOfEmployees", listOfEmployees);
				redirectAttributes.addFlashAttribute("message", "Employee updated successfully!");
				return new ModelAndView("redirect:/viewAssociateTable");
			} else {
				modelAndView.addObject("message", "Employee couldn't be updated");
				modelAndView.setViewName("associate_update");
				return modelAndView;
			}
		} catch (ForeignKeyException de) {

			de.printStackTrace();
			modelAndView.addObject("message", "Employee couldn't be updated");
			modelAndView.setViewName("associate_update");
			return modelAndView;

		}

	}

	@RequestMapping("/associate/delete/{empId}")
	public String deleteEmployee(@PathVariable("empId") int empId, Model model, RedirectAttributes redirectAttributes) {
		try {
			int result = employeeDao.deleteEmployee(empId);
			List<Employee> listOfEmployees = employeeDao.showData();

			redirectAttributes.addFlashAttribute("listOfEmployees", listOfEmployees);
			if (result > 0) {
				redirectAttributes.addFlashAttribute("message", "Employee record deleted successfully");
			} else {
				redirectAttributes.addFlashAttribute("message", "Employee record cannot be deleted");
			}
			return "redirect:/viewAssociateTable";
		} catch (DataIntegrityViolationException dke) {

			dke.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "The employee has project and task assignments!");
			return "redirect:/viewAssociateTable";
		}
	}

	@RequestMapping("/openUpdateProjectPage/{projectId}")
	public String openUpdateProjectPage(@PathVariable("projectId") int projectId, Model model,
			@ModelAttribute("message") String message) {
		Project projectToUpdate = projectDao.getSingleProject(projectId);
		model.addAttribute("message");
		model.addAttribute("projectToUpdate", projectToUpdate);

		return "project_update";
	}

	@RequestMapping("/updateproject/{projectId}")
	public ModelAndView updateProject(@RequestParam("pname") String pname, @RequestParam("pdescription") String desc,
			@RequestParam("lname") String lname, @RequestParam("sdate") int duration,
			@PathVariable("projectId") int projectId, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		Project project = new Project();
		project.setProjectId(projectId);
		project.setProjectName(pname);
		project.setProjectDesc(desc);
		project.setLeadName(lname);
		project.setDuration(duration);

		try {
			int result = projectDao.updateProject(project);
			if (result > 0) {
				List<Project> listOfProjects = projectDao.showProject();
				redirectAttributes.addFlashAttribute("listOfProjects", listOfProjects);
				redirectAttributes.addFlashAttribute("message", "Project updated successfully!");
				return new ModelAndView("redirect:/viewProjectTable");
			} else {
				modelAndView.addObject("message", "Project couldn't be updated");
				modelAndView.setViewName("project_update");
			}
		} catch (DataIntegrityViolationException fke) {

			fke.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "The associate doesn't exist!");
			modelAndView.setViewName("redirect:/openUpdateProjectPage/{projectId}");
		}

		return modelAndView;
	}

	@RequestMapping("/project/delete/{projectId}")
	public String deleteProject(@PathVariable("projectId") int projectId, Model model,
			RedirectAttributes redirectAttributes) {
		try {
			int result = projectDao.deleteProject(projectId);
			List<Project> listOfProjects = projectDao.showProject();
			redirectAttributes.addFlashAttribute("listOfProjects", listOfProjects);
			if (result > 0) {
				redirectAttributes.addFlashAttribute("message", "Project record deleted successfully");
			} else {
				redirectAttributes.addFlashAttribute("message", "Project record cannot be deleted");
			}
		} catch (DataAccessException e) {

			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "Project record cannot be deleted");
		}
		return "redirect:/viewProjectTable";
	}

}
