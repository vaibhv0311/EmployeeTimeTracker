package employee.dao;

import java.util.List;

import employee.entities.Project;

public interface ProjectDao {
	public int insertProject(Project project);

	public int updateProject(Project project);

	Project getSingleProject(int projectId);

	public int deleteProject(int projectId);

	List<Project> showProject();
}
