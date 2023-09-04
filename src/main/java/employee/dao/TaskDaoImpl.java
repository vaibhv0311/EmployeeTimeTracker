package employee.dao;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import employee.entities.Task;

public class TaskDaoImpl implements TaskDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return this.jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int addTask(Task task) throws DataAccessException {
		String addTaskQuery = "INSERT INTO tasks(empUserName,taskName,taskDescription,date,startTime,endTime,status)"
				+ "VALUES(?,?,?,?,?,?,?)";
		return this.jdbcTemplate.update(addTaskQuery, task.getUsername(), task.getTaskName(), task.getDesc(),
				task.getDate(), task.getStartTime(), task.getEndTime(), task.getStatus());
	}

	@Override
	public int updateTask(Task task) throws DataAccessException {

		String updateQuery = "UPDATE tasks set taskName = ?,taskDescription=?,startTime=?,endTIme=?,status=?,date=? WHERE tid=?";
		return this.jdbcTemplate.update(updateQuery, task.getTaskName(), task.getDesc(), task.getStartTime(),
				task.getEndTime(), task.getStatus(), task.getDate(), task.getTaskId());
	}

	@Override
	public List<Task> getAllTasks(String username) throws DataAccessException {

		String getTaskQuery = "SELECT * FROM tasks WHERE empUserName=?";
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(getTaskQuery, username);
		List<Task> taskList = new ArrayList<>();
		System.out.println(username);
		for (Map<String, Object> row : rows) {
			Task task = new Task();
			task.setTaskId((int) row.get("tid"));
			task.setTaskName((String) row.get("taskName"));
			task.setUsername((String) row.get("empUserName"));
			task.setDesc((String) row.get("taskDescription"));
			java.sql.Date sqlDate1 = (java.sql.Date) row.get("date");
			LocalDate localDate1 = sqlDate1.toLocalDate();
			task.setDate(localDate1);
			java.sql.Time sqlTime1 = (java.sql.Time) row.get("startTime");
			LocalTime localTime1 = sqlTime1.toLocalTime();
			task.setStartTime(localTime1);
			java.sql.Time sqlTime2 = (java.sql.Time) row.get("endTime");
			LocalTime localTime2 = sqlTime2.toLocalTime();
			task.setEndTime(localTime2);
			task.setStatus((String) row.get("status"));
			taskList.add(task);
		}

		return taskList;
	}

	@Override
	public Task getTaskById(int taskid) {
		String getSingleTask = "SELECT * FROM tasks WHERE tid=?";
		return this.jdbcTemplate.queryForObject(getSingleTask, new TaskRowMapperImpl(), taskid);

	}

	@Override
	public int deleteTask(int taskid) throws DataAccessException {
		String deleteQuery = "DELETE FROM tasks WHERE tid=?";
		return this.jdbcTemplate.update(deleteQuery, taskid);
	}

}
