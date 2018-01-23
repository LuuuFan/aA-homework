import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
// import logger from redux-logger;

// Phase 3
const addLoggingToDispatch = store => next => action => {
  console.log(`oldState:`);
  console.log(store.getState());
  console.log('action:');
  console.log(action);
  next(action)
  console.log(`newState:`);
  console.log(store.getState());
};


const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
