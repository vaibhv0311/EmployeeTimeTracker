package employee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import employee.entities.Task;

public class TaskRowMapperImpl implements RowMapper<Task> {

	@Override
	public Task mapRow(ResultSet rs, int rowNum) throws SQLException {

		Task task = new Task();
		task.setTaskId(rs.getInt("tid"));
		task.setUsername(rs.getString("empUserName"));
		task.setTaskName(rs.getString("taskName"));
		task.setDesc(rs.getString("taskDescription"));
		task.setDate(rs.getDate("date").toLocalDate());
		task.setStartTime(rs.getTime("startTime").toLocalTime());
		task.setEndTime(rs.getTime("endTime").toLocalTime());
		task.setStatus(rs.getString("status"));
		return task;

	}

}
