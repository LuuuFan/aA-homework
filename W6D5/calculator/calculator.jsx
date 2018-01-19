import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: '', num2: '', result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.minus = this.minus.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1 (e){
    if (e.target.value) {
      const num1 = parseInt(e.target.value);
      this.setState({num1});
    }
  }

  setNum2 (e){
    if (e.target.value) {
      const num2 = parseInt(e.target.value);
      this.setState({num2});
    }
  }

  add (e){
    e.preventDeault;
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  minus (e){
    e.preventDeault;
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiply (e){
    e.preventDeault;
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide (e){
    e.preventDeault;
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear (e){
    e.preventDeault;
    this.setState({num1: '', num2:'', result:0});
  }

  render(){
    const { num1, num2, result } = this.state;
    return (
      <div>
       <h1>{result}</h1>
       <br />
       <input onChange={this.setNum1} value={num1}/>
       <br />
       <input onChange={this.setNum2} value={num2}/>
       <br />
       <button onClick={this.add}>+</button>
       <button onClick={this.minus}>-</button>
       <button onClick={this.multiply}>*</button>
       <button onClick={this.divide}>/</button>
       <br />
       <button onClick={this.clear}>Clear</button>
     </div>
    );
  }
}

export default Calculator;
