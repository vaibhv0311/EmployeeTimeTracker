package entity.tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import employee.entities.Project;

class ProjectTest {

	@Test
	public void TestProjectGetterAndSetter() {
		Project project = new Project();
		Project project1 = new Project();

		project.setProjectId(1);
		project.setProjectName("Test1");
		project.setProjectDesc("Test description A");
		project.setLeadName("Employee1");
		project.setDuration(12);

		assertEquals(1, project.getProjectId());
		assertEquals("Test1", project.getProjectName());
		assertEquals("Test description A", project.getProjectDesc());
		assertEquals("Employee1", project.getLeadName());
		assertEquals(12, project.getDuration());

		project1.setProjectId(2);
		project1.setProjectName("Test2");
		project1.setProjectDesc("Test description B");
		project1.setLeadName("Employee2");
		project1.setDuration(8);

		assertEquals(2, project1.getProjectId());
		assertEquals("Test2", project1.getProjectName());
		assertEquals("Test description B", project1.getProjectDesc());
		assertEquals("Employee2", project1.getLeadName());
		assertEquals(8, project1.getDuration());
	}

}
