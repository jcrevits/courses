import { FETCH_USER, SUBMITTING_SURVEY, DONE_SUBMITTING } from '../actions/types';

export default function(state = null, action) {
  switch (action.type) {
    case SUBMITTING_SURVEY:
      return { loading: true };
    case DONE_SUBMITTING:
      return { loading: false };
    case FETCH_USER:
      return action.payload || false;
    default:
      return state;
  }
}
