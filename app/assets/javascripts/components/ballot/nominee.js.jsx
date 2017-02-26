var BallotNominee = React.createClass({
  propTypes: {
    nominee: React.PropTypes.object.isRequired,
    isSelected: React.PropTypes.bool.isRequired,
    handleVote: React.PropTypes.func.isRequired
  },

  isSelected: function() {
    if(this.props.isSelected) {
      return "selected";
    };
  },

  handleVote() {
    this.props.handleVote(this.props.nominee.id);
  },

  render: function() {
    return (
      <div className={this.isSelected()}>
        <div onClick={this.handleVote}>{this.props.nominee.name}</div>
      </div>
    );
  }
});
