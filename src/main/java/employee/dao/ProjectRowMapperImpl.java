package employee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import employee.entities.Project;

public class ProjectRowMapperImpl implements RowMapper<Project> {

	@Override
	public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Project project = new Project();
		project.setProjectId(rs.getInt("projectId"));
		project.setProjectName(rs.getString("projectName"));
		project.setProjectDesc(rs.getString("projectDesc"));
		project.setLeadName(rs.getString("leadName"));
		project.setDuration(rs.getInt("totalWeeks"));
		return project;
	}

}
