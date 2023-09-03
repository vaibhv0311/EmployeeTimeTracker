package employee.controller;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import employee.dao.EmployeeDao;
import employee.dao.TaskDao;
import employee.entities.Employee;
import employee.entities.Task;
import employee.exceptions.ForeignKeyException;

@Controller
public class AssociateController {

	@Autowired
	EmployeeDao employeeDao;

	@Autowired
	TaskDao taskDao;

	String viewUserName = "";

	@RequestMapping(value = "/associatelogin", method = RequestMethod.POST)
	public String associateLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request) {

		try {
			Employee employeeRegistered = employeeDao.isEmployeeRegistered(username, password);

			if (employeeRegistered != null) {
				HttpSession session = request.getSession();
				viewUserName = username;

				Employee viewEmployee = employeeDao.viewEmployee(username);
				session.setAttribute("employeeRegistered", viewEmployee);
				return "05_associateview";
			} else {
				model.addAttribute("result", "Cannot find credentials! Contact Team Leader");
				return "03_associatelogin";
			}
		} catch (DataAccessException e) {

			e.printStackTrace();
			model.addAttribute("result", "Cannot find credentials! Contact Team Leader");
			return "03_associatelogin";

		}

	}

	@GetMapping("/logout")
	public String processLogout(HttpSession session, Model attr) {

		System.out.println(session.getAttribute("employeeRegistered"));
		session.invalidate();
		attr.addAttribute("result", "Logged out successfully");
		return "03_associatelogin";
	}

	// Go to the tasks page
	@GetMapping(value = "/edittasks")
	public String projectPage() {
		return "051_edittasks";
	}

	@PostMapping("/addtask")
	public String addTask(@RequestParam("username") String username, @RequestParam("taskName") String taskName,
			@RequestParam("description") String desc, @RequestParam("date") String date,
			@RequestParam("startTime") String startTime, @RequestParam("endTime") String endTime,
			@RequestParam("status") String status, Model model) {
		try {
			Task task = new Task();
			task.setTaskName(taskName);
			task.setUsername(username);
			task.setDesc(desc);
			task.setDate(LocalDate.parse(date));
			task.setStartTime(LocalTime.parse(startTime));
			task.setEndTime(LocalTime.parse(endTime));
			task.setStatus(status);

			int result = taskDao.addTask(task);
			if (result == 1) {
				model.addAttribute("addMessage", "Data added successfully");
				return "051_edittasks";
			} else {
				model.addAttribute("addMessage", "Data addition failed");
				return "051_edittasks";

			}
		} catch (DataAccessException de) {
			// TODO Auto-generated catch block
			model.addAttribute("addMessage", "Data addition failed, Please check the values");
			de.printStackTrace();
			return "051_edittasks";
		}

	}

	@GetMapping("/tasktable")
	public String viewTask(Model model, @ModelAttribute("message") String message) {

		List<Task> getAllTasks = taskDao.getAllTasks(viewUserName);

		model.addAttribute("getAllTasks", getAllTasks);
		model.addAttribute("message", message);
		List<Task> tasks = taskDao.getAllTasks(viewUserName);

		List<Integer> taskDuration = new ArrayList<Integer>();
		for (Task task : tasks) {
			LocalTime startTime = task.getStartTime();
			LocalTime endTime = task.getEndTime();
			Duration duration = Duration.between(startTime, endTime);
			long durationMinutes = duration.toMinutes();
			taskDuration.add((int) durationMinutes);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String taskDurationsJson = objectMapper.writeValueAsString(taskDuration);

			model.addAttribute("taskDurationsJson", taskDurationsJson);

		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "taskview";
	}

	@RequestMapping("/openUpdateTaskPage/{taskId}")
	public String openUpdateTaskPage(@PathVariable("taskId") int taskId, Model model) {
		Task taskToUpdate = taskDao.getTaskById(taskId);
		model.addAttribute("taskToUpdate", taskToUpdate);
		System.out.println(taskToUpdate);
		return "taskupdate";
	}

	@RequestMapping("/updatetask/{taskId}")
	public ModelAndView updateTask(

			@RequestParam("taskName") String taskName, @RequestParam("description") String desc,
			@RequestParam("date") String date, @RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime, @RequestParam("status") String status,
			@PathVariable("taskId") int taskId, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		Task task = new Task();
		task.setTaskId(taskId);
		task.setUsername(viewUserName);
		task.setTaskName(taskName);
		task.setDesc(desc);
		task.setDate(LocalDate.parse(date));
		task.setStartTime(LocalTime.parse(startTime));
		task.setEndTime(LocalTime.parse(endTime));
		task.setStatus(status);

		try {
			int result = taskDao.updateTask(task);
			if (result > 0) {
				List<Task> getAllTasks = taskDao.getAllTasks(viewUserName);
				redirectAttributes.addFlashAttribute("getAllTasks", getAllTasks);
				redirectAttributes.addFlashAttribute("message", "Task updated successfully");
				return new ModelAndView("redirect:/tasktable");
			} else {
				redirectAttributes.addFlashAttribute("message", "Task couldn't be updated");
				modelAndView.setViewName("taskupdate");
				return modelAndView;
			}
		} catch (ForeignKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "Task couldn't be updated");
			modelAndView.setViewName("taskupdate");
			return modelAndView;
		}

	}

	@RequestMapping("/task/delete/{taskId}")
	public String deleteTask(@PathVariable("taskId") int taskId, Model model, RedirectAttributes redirectAttributes) {

		try {
			int result = taskDao.deleteTask(taskId);
			List<Task> getAllTasks = taskDao.getAllTasks(viewUserName);
			redirectAttributes.addFlashAttribute("getAllTasks", getAllTasks);
			if (result > 0) {
				redirectAttributes.addFlashAttribute("message", "Task Deleted sucessfully");
			} else {
				redirectAttributes.addFlashAttribute("message", "Task Deletion failed");
			}
			return "redirect:/tasktable";
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "Task Deletion failed");
			return "redirect:/tasktable";
		}
	}

}
