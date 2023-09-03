package employee.dao;

import java.util.List;

import employee.entities.Employee;

public interface EmployeeDao {
	public int insertEmployee(Employee employee);

	Employee isEmployeeRegistered(String username, String password);

	public int updateEmployee(Employee employee);

	public int deleteEmployee(int EmpId);

	Employee getEmployee(int empId);

	Employee viewEmployee(String username);

	List<Employee> showData();
}
