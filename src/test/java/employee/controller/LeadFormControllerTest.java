package employee.controller;

import employee.dao.EmployeeDao;
import employee.dao.ProjectDao;
import employee.entities.Employee;
import employee.entities.Project;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class LeadFormControllerTest {

	@Mock
	private EmployeeDao employeeDao;

	@Mock
	private ProjectDao projectDao;

	@Mock
	private Model model;

	@InjectMocks
	private LeadFormController leadFormController;

	@BeforeEach
	public void setup() {
		MockitoAnnotations.openMocks(this);
	}

	@Test
	public void testHandleForm() {
		// Create a sample Employee object
		Employee employee = new Employee();
		employee.setName("John Doe");
		// ... Set other properties as needed

		// Mock the behavior of the EmployeeDao
		when(employeeDao.insertEmployee(any(Employee.class))).thenReturn(1);

		// Call the controller method
		String result = leadFormController.handleAssociateForm("John Doe", "123", "johndoe", "password", "password",
				"lead123", "role", "Project A", "Description", model);

		// Verify that the model attribute "success" is set
		verify(model).addAttribute("success", "Employee Added Successfully");
		// Verify that the EmployeeDao.insertEmployee method was called
		verify(employeeDao).insertEmployee(any(Employee.class));
		// Assert the expected view name
		assertEquals("04_leadview", result);
	}

	@Test
	public void testHandleProjectForm() {
		// Create a sample Project object
		Project project = new Project();
		project.setProjectName("Project X");
		// ... Set other properties as needed

		// Mock the behavior of the ProjectDao
		when(projectDao.insertProject(any(Project.class))).thenReturn(1);

		// Call the controller method
		String result = leadFormController.handleProjectForm("Project X", "Project description", "Lead Name", 30,
				model);

		// Verify that the ProjectDao.insertProject method was called
		verify(projectDao).insertProject(any(Project.class));
		// Assert the expected view name
		assertEquals("04_leadview", result);
	}

}
