package com.lql.service.imp;

import com.lql.dao.StateMapper;
import com.lql.domain.State;
import com.lql.service.StateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
@Service("stateService")
@Transactional
public class StateServiceImp implements StateService{

    @Autowired
    private StateMapper stateMapper;

    public List<State> getStatesByUserId(String userId) {

        List<State> states = stateMapper.queryStatesByUserId(userId);
        return states;
    }

    public void saveNewState(State state) {
        stateMapper.saveNewState(state);
    }

    public void deleteStateById(Integer id) {
        stateMapper.deleteStateById(id);
    }
}
