package employee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import employee.entities.Employee;

public class RowMapperImpl implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		Employee employee = new Employee();
		employee.setEmpId(rs.getInt("empId"));
		employee.setName(rs.getString("empName"));
		employee.setUserName(rs.getString("empUserName"));
		employee.setId(rs.getString("email"));
		employee.setPassword(rs.getString("password"));
		employee.setLeadId(rs.getString("empManager"));
		employee.setRole(rs.getString("empRole"));
		employee.setProjectTitle(rs.getString("project"));
		employee.setDescription(rs.getString("projectDesc"));

		return employee;
	}

}
