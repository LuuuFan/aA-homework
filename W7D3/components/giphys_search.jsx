import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (){
    super();
    this.state = {searchTerm: ''};
  }

  handleChange(e){
    let value = e.target.value;
    console.log(value);
    this.setState({searchTerm: value});
  }

  handleClick(){
    console.log(this.state.searchTerm);
    this.props.fetchSearchGiphys(this.state.searchTerm);
    console.log(this.props.giphys);
    this.setState({searchTerm: ''});
  }

  render(){
    // debugger
    return(
      <div>
        <h1>Search Giphy!</h1>
        <form>
          <input onChange={(e)=>this.handleChange(e)} placeholder='Husky' />
          <button onClick={()=>this.handleClick()}>Search Giphy</button>
        </form>
      </div>
    );
  }
}

export default GiphysSearch;
// <GiphysIndex giphys={this.props.giphys} />
//
//
