/*加减数字框*/
class Spinner extends React.Component{
    constructor(){
        super();
        this.state = {
            num : 0
        }
    }
    increase(){
        this.setState({
            num:(this.state.num === this.props.max)?this.props.max:(this.state.num+1)
        });
    }
    decrease(){
        this.setState({
            num:(this.state.num === this.props.min)?this.props.min:(this.state.num-1)
        });
    }
    /*渲染组件*/
    render(){
        return (
            <div>
                <input className={""} value={this.state.num}/>
                <input type="button" value='-' onClick={this.decrease.bind(this)}/>
                <input type="button" value='+' onClick={this.increase.bind(this)}/>
            </div>
        )
    }
}
ReactDOM.render(
    <Spinner min='0' max='999'/>,
    document.getElementById('spinner')
);
