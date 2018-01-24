import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import {fetchSearchGiphys} from './util/api_util';
import {receiveSearchGiphys, fetchSearchGiphys} from './actions/giphy_actions';

$(document).ready(()=>{
  const store = configureStore();
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  // window.receiveSearchGiphys = receiveSearchGiphys;
  // fetchSearchGiphys("puppies").then((res) => console.log(res.data));
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
