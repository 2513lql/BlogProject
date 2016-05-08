package com.lql.dao;

import com.lql.domain.State;

import java.util.List;

/**
 * Created by LQL on 2016/5/7.
 */
public interface StateMapper {

    public List<State> queryStatesByUserId(String userId);
    public void saveNewState(State state);
    public void deleteStateById(Integer id);
}
