import axios from 'axios';

import { FETCH_SURVEYS, FETCH_USER, SUBMITTING_SURVEY, DONE_SUBMITTING } from './types';

export const fetchUser = () => async dispatch => {
  const res = await axios.get('/api/current_user');
  dispatch({ type: FETCH_USER, payload: res.data });
};

export const handleToken = token => async dispatch => {
  const res = await axios.post('/api/stripe', token);
  dispatch({ type: FETCH_USER, payload: res.data });
};

export const submitSurvey = (values, history) => async dispatch => {
  dispatch({ type: SUBMITTING_SURVEY, payload: {} });
  const res = await axios.post('/api/surveys', values);
  dispatch({ type: DONE_SUBMITTING, payload: {} });

  history.push('/surveys');
  dispatch({ type: FETCH_USER, payload: res.data });
};

export const fetchSurveys = () => async dispatch => {
  const res = await axios.get('/api/surveys');
  dispatch({ type: FETCH_SURVEYS, payload: res.data });
};

export const deleteSurvey = surveyId => async dispatch => {
  await axios.delete(`api/surveys/${surveyId}`);
  const res = await axios.get('/api/surveys');
  dispatch({ type: FETCH_SURVEYS, payload: res.data });
};
