import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
//
// Phase1
// const addLoggingToDispatch = (store) => {
//   let storeDispatch = store.dispatch;
//   return (action) => {
//     console.log(`oldState:`);
//     console.log(store.getState());
//     storeDispatch(action);
//     console.log(`newState:`);
//     console.log(store.getState());
//   };
// };

// Phase2
// const addLoggingToDispatch = store => next => action => {
//   console.log(`oldState:`);
//   console.log(store.getState());
//   console.log('action:');
//   console.log(action);
//   next(action)
//   console.log(`newState:`);
//   console.log(store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares)=>{
//   let dispatch = store.dispatch;
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, {dispatch});
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
