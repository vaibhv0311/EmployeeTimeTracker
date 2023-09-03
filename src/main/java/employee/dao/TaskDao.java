package employee.dao;

import java.util.List;

import employee.entities.Task;

public interface TaskDao {
	public int addTask(Task task);

	public int updateTask(Task task);

	List<Task> getAllTasks(String username);

	Task getTaskById(int taskid);

	public int deleteTask(int taskid);

}
