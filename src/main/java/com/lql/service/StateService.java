package com.lql.service;

import com.lql.domain.State;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface StateService {

    public List<State> getStatesByUserId(String userId);
    public void saveNewState(State state);
    public void deleteStateById(Integer id);
}
