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
      <button
        type="button"
        className={["nominee btn btn-secondary btn-lg btn-block", this.isSelected()].join(" ").trim()}
        onClick={this.handleVote}
      >
        {this.props.nominee.name}, {this.props.nominee.description}
      </button>
    );
  }
});
