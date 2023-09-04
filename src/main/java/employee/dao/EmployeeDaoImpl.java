package employee.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import employee.entities.Employee;
import employee.exceptions.ForeignKeyException;

public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private JdbcTemplate jdbctemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbctemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbctemplate = jdbcTemplate;
	}

	@Override
	public int insertEmployee(Employee employee) throws DataAccessException {
		String insertQuery = "INSERT INTO EMPLOYEE(empName,email,empUserName,password,"
				+ "empManager,empRole,project,projectDesc)" + "VALUES(?,?,?,?,?,?,?,?)";

		return this.jdbctemplate.update(insertQuery, employee.getName(), employee.getId(), employee.getUserName(),
				employee.getPassword(), employee.getLeadId(), employee.getRole(), employee.getProjectTitle(),
				employee.getDescription());
	}

	@Override
	public Employee isEmployeeRegistered(String username, String password) throws DataAccessException {
		String checkQuery = "SELECT * FROM employee WHERE empUserName=? AND password=?";
		Employee employee = null;

		if (username != null && !username.isEmpty()) {
			if (password != null && !password.isEmpty()) {

				employee = jdbctemplate.queryForObject(checkQuery, new RowMapperImpl(), username, password);
			}
		}
		return employee;
	}

	@Override
	public List<Employee> showData() {

		String getAllData = "SELECT * FROM employee";

		return this.jdbctemplate.query(getAllData, new RowMapperImpl());
	}

	@Override
	public int updateEmployee(Employee employee) throws ForeignKeyException {

		String updateQuery = "UPDATE employee SET empName=?,email=?,password=?,"
				+ "empManager=?,empRole=?,project=?,projectDesc=? WHERE empId=?";

		return this.jdbctemplate.update(updateQuery, employee.getName(), employee.getId(), employee.getPassword(),
				employee.getLeadId(), employee.getRole(), employee.getProjectTitle(), employee.getDescription(),
				employee.getEmpId());
	}

	@Override
	public int deleteEmployee(int empId) throws ForeignKeyException {
		String deleteQuery = "DELETE FROM employee WHERE empId=?";
		return this.jdbctemplate.update(deleteQuery, empId);
	}

	@Override
	public Employee getEmployee(int empId) {
		String getSingleEmployee = "SELECT * FROM employee WHERE empId=?";
		return this.jdbctemplate.queryForObject(getSingleEmployee, new RowMapperImpl(), empId);
	}

	@Override
	public Employee viewEmployee(String username) {
		String viewEmployeeQuery = "SELECT * FROM employee WHERE empUserName=?";
		return this.jdbctemplate.queryForObject(viewEmployeeQuery, new RowMapperImpl(), username);
	}

}
