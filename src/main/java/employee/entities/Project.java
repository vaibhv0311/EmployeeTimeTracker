package employee.entities;

public class Project {
	private int projectId;
	private String projectName;
	private String projectDesc;
	private String leadName;
	private int duration;

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(int projectId, String projectName, String projectDesc, String leadName, int duration) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectDesc = projectDesc;
		this.leadName = leadName;
		this.duration = duration;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDesc() {
		return projectDesc;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}

	public String getLeadName() {
		return leadName;
	}

	public void setLeadName(String leadName) {
		this.leadName = leadName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "\nProject [projectId=" + projectId + ", projectName=" + projectName + ", projectDesc=" + projectDesc
				+ ", leadName=" + leadName + ", duration=" + duration + "]";
	}

}
