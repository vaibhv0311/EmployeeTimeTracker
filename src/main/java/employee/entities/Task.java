package employee.entities;

import java.time.LocalDate;
import java.time.LocalTime;

public class Task {
	private int taskId;
	private String username;
	private String taskName;
	private String desc;
	private LocalDate date;
	private LocalTime startTime;
	private LocalTime endTime;
	private String status;
	private long duration;

	public Task() {
		super();
	}

	public Task(int taskId, String username, String taskName, String desc, LocalDate date, LocalTime startTime,
			LocalTime endTime, String status, long duration) {
		super();
		this.taskId = taskId;
		this.username = username;
		this.taskName = taskName;
		this.desc = desc;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.duration = duration;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date2) {
		this.date = date2;
	}

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "Task [ taskId=" + taskId + "username=" + username + ", taskName=" + taskName + ", desc=" + desc
				+ ", date=" + date + ", startTime=" + startTime + ", endTime=" + endTime + ", status=" + status + "]";
	}
}
