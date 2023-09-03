package employee.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import employee.entities.Project;

public class ProjectDaoImpl implements ProjectDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertProject(Project project) throws DataAccessException {
		// TODO Auto-generated method stub
		String insertQuery = "INSERT INTO projects(projectName," + "projectDesc,leadName,totalWeeks)"
				+ "VALUES(?,?,?,?)";

		return this.jdbcTemplate.update(insertQuery, project.getProjectName(), project.getProjectDesc(),
				project.getLeadName(), project.getDuration());
	}

	@Override
	public List<Project> showProject() {
		// TODO Auto-generated method stub
		String getAllData = "SELECT * FROM projects";
		return this.jdbcTemplate.query(getAllData, new ProjectRowMapperImpl());
	}

	@Override
	public int updateProject(Project project) throws DataAccessException {
		String updateQuery = "UPDATE projects SET leadName=?,projectName=?,projectDesc=?,totalWeeks=? WHERE projectId=?";

		return this.jdbcTemplate.update(updateQuery, project.getLeadName(), project.getProjectName(),
				project.getProjectDesc(), project.getDuration(), project.getProjectId());
	}

	@Override
	public Project getSingleProject(int projectId) throws DataAccessException {
		String singleQuery = "SELECT * FROM projects WHERE projectId=?";
		return this.jdbcTemplate.queryForObject(singleQuery, new ProjectRowMapperImpl(), projectId);
	}

	@Override
	public int deleteProject(int projectId) throws DataAccessException {
		String deleteQuery = "DELETE FROM projects WHERE projectId=?";
		return this.jdbcTemplate.update(deleteQuery, projectId);
	}

}
