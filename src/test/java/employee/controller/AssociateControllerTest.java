package employee.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import employee.dao.EmployeeDao;
import employee.dao.TaskDao;
import employee.entities.Employee;
import employee.entities.Task;

public class AssociateControllerTest {

    private MockMvc mockMvc;

    @InjectMocks
    private AssociateController associateController;

    @Mock
    private EmployeeDao employeeDao;

    @Mock
    private TaskDao taskDao;

    @Mock
    private View mockView;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");

        mockMvc = MockMvcBuilders.standaloneSetup(associateController)
                .setViewResolvers(viewResolver)
                .setSingleView(mockView)
                .build();
    }

    @Test
    public void testAssociateLogin() throws Exception {
        // Mock your service layer or DAO calls as needed
        Employee mockEmployee = new Employee();
        mockEmployee.setUserName("testuser");
        mockEmployee.setPassword("testpassword");

        // Use mockMvc to simulate a POST request with form parameters
        mockMvc.perform(post("/associatelogin")
                .param("username", "testuser")
                .param("password", "testpassword"))
                .andExpect(status().isOk())
                .andExpect(view().name("05_associateview"))
                .andExpect(model().attributeExists("employeeRegistered"));
    }

    @Test
    public void testAddTask() throws Exception {
        // Mock your service layer or DAO calls as needed
        Task mockTask = new Task();
        mockTask.setTaskName("Test Task");

        // Use mockMvc to simulate a POST request with form parameters
        mockMvc.perform(post("/addtask")
                .param("username", "testuser")
                .param("taskName", "Test Task")
                .param("description", "Test Description")
                .param("date", "2023-08-25")
                .param("startTime", "08:00")
                .param("endTime", "10:00")
                .param("status", "Completed"))
                .andExpect(status().isOk())
                .andExpect(view().name("051_edittasks"))
                .andExpect(model().attributeExists("addMessage"));
    }

    // Add more test methods for other controller actions...

}
