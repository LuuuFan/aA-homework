// import React from 'react';
// import GiphysIndex from './giphys_index';

import React from 'react';
import GiphysIndex from './giphys_index';
// import GiphysIndexItem from './giphys_index_item';



class GiphysSearch extends React.Component {
  constructor (){
    super();
    this.state = {searchTerm: ''};
  }

  handleChange(e){
    // let value = e.target.value;
    // console.log(e.target.value);
    this.setState({searchTerm: e.target.value});
    // console.log(this.state.searchTerm);
  }

  handleClick(e){
    e.preventDefault();
    const search = this.state.searchTerm.split(' ').join('+');
    // console.log(this.state.searchTerm);
    // debugger
    this.props.fetchSearchGiphys(search);
    // console.log(this.props.giphys);
    this.setState({searchTerm: ''});
  }

  render(){
    const {giphys} = this.props;
    // debugger
    return(
      <div>
        <h1>Search Giphy!</h1>
        <form>
          <input onChange={(e)=>this.handleChange(e)} value={this.state.searchTerm} />
          <button onClick={(e)=>this.handleClick(e)}>Search Giphy</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
// <ul>
//   {giphys}
//   {giphys.map(giphy => <li>{giphy}</li>)}
// </ul>
// <GiphysIndex giphys={giphys} />
// <GiphysIndex giphys={giphys} />
//
//
