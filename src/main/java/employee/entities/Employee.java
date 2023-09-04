package employee.entities;

public class Employee {
	private int empId;
	private String name;
	private String id;
	private String userName;
	private String password;
	private String leadId;
	private String role;
	private String projectTitle;
	private String description;

	public Employee() {
		super();
	}

	public Employee(int empId, String name, String id, String userName, String password, String leadId, String role,
			String projectTitle, String description) {
		super();
		this.empId = empId;
		this.name = name;
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.leadId = leadId;
		this.role = role;
		this.projectTitle = projectTitle;
		this.description = description;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLeadId() {
		return leadId;
	}

	public void setLeadId(String leadId) {
		this.leadId = leadId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "\nEmployee [empId=" + empId + ", name=" + name + ", id=" + id + ", userName=" + userName + ", password="
				+ password + ", leadId=" + leadId + ", role=" + role + ", projectTitle=" + projectTitle
				+ ", description=" + description + "]";
	}

}
