package entity.tests;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.LocalTime;

import employee.entities.Task;

public class TaskTest {

	@Test
	public void TestTaskGetterAndSetter() {
		Task task = new Task();

		task.setTaskId(1);
		task.setTaskName("testTask");
		task.setDesc("loremIpsum");
		task.setUsername("emp1");
		task.setDate(LocalDate.of(2023, 03, 20));
		task.setStartTime(LocalTime.of(05, 10, 30));
		task.setEndTime(LocalTime.of(06, 10, 30));
		task.setStatus("finished");
		task.setDuration(60);

		assertEquals(1, task.getTaskId());
		assertEquals("testTask", task.getTaskName());
		assertEquals("emp1", task.getUsername());
		assertEquals("loremIpsum", task.getDesc());
		assertEquals(LocalDate.of(2023, 03, 20), task.getDate());
		assertEquals(LocalTime.of(05, 10, 30), task.getStartTime());
		assertEquals(LocalTime.of(06, 10, 30), task.getEndTime());
		assertEquals("finished", task.getStatus());
		assertEquals(60, task.getDuration());
	}

}
