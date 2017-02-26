var BallotNominee = React.createClass({
  propTypes: {
    nominee: React.PropTypes.object.isRequired,
    isSelected: React.PropTypes.bool.isRequired,
    handleVote: React.PropTypes.func.isRequired
  },

  isSelected: function() {
    if(this.props.isSelected) {
      return "voted";
    };
  },

  handleVote() {
    this.props.handleVote(this.props.nominee.id);
  },

  render: function() {
    return (
      <div
        onClick={this.handleVote}
        className={["nominee", this.isSelected()].join(" ").trim()}
      >
        <div>{this.props.nominee.name}</div>
      </div>
    );
  }
});
