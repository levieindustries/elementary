class CategoryBallot extends React.Component {
  render () {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Nominees: {this.props.nominees}</div>
      </div>
    );
  }
}

CategoryBallot.propTypes = {
  name: React.PropTypes.string,
  nominees: React.PropTypes.array
};
