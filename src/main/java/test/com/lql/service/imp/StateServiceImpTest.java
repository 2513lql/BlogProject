package com.lql.service.imp;

import com.lql.domain.State;
import com.lql.service.StateService;
import junit.framework.Test;
import junit.framework.TestSuite;
import junit.framework.TestCase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * StateServiceImp Tester.
 *
 * @author <Authors name>
 * @since <pre>05/07/2016</pre>
 * @version 1.0
 */
public class StateServiceImpTest extends TestCase {
    public StateServiceImpTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    public void testGetStatesByUserId() throws Exception {
        //TODO: Test goes here...
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:config/spring-mybatis.xml");
        StateService stateService = context.getBean("stateService", StateService.class);
        List<State> states = stateService.getStatesByUserId("2513LQL");
        System.out.println(states.get(0).getUser().getPassword());

        State state = states.get(0);
        state.setId(null);

        stateService.saveNewState(state);

        stateService.deleteStateById(2);
    }

    public static Test suite() {
        return new TestSuite(StateServiceImpTest.class);
    }
}
