package entity.tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import employee.entities.Employee;

class EmployeeTest {

	@Test
	public void testEmployeeGetterAndSetter() {
		Employee employee = new Employee();

		// Set values using setters
		employee.setEmpId(1);
		employee.setName("John Doe");
		employee.setId("EMP123");
		employee.setUserName("johndoe");
		employee.setPassword("pass123");
		employee.setLeadId("lead123");
		employee.setRole("Developer");
		employee.setProjectTitle("Project A");
		employee.setDescription("Description A");

		// Use getters to retrieve values
		assertEquals(1, employee.getEmpId());
		assertEquals("John Doe", employee.getName());
		assertEquals("EMP123", employee.getId());
		assertEquals("johndoe", employee.getUserName());
		assertEquals("pass123", employee.getPassword());
		assertEquals("lead123", employee.getLeadId());
		assertEquals("Developer", employee.getRole());
		assertEquals("Project A", employee.getProjectTitle());
		assertEquals("Description A", employee.getDescription());
	}

}
