var BallotNominee = React.createClass({
  propTypes: {
    nominee: React.PropTypes.object.isRequired,
    isSelected: React.PropTypes.bool.isRequired,
    handleVote: React.PropTypes.func.isRequired,
    isWinner: React.PropTypes.bool
  },

  isSelected: function() {
    if(this.props.isSelected) {
      return "voted";
    };
  },

  isWinner: function() {
    if(this.props.isWinner) {
      return "winner";
    }
  },

  handleVote() {
    this.props.handleVote(this.props.nominee.id);
  },

  renderDescription() {
    if(!this.props.nominee.description) return;

    return (
      <div className="description">{this.props.nominee.description}</div>
    )
  },

  render: function() {
    return (
      <a
        className={["nominee btn btn-secondary btn-lg btn-block", this.isSelected(), this.isWinner()].join(" ").trim()}
        onClick={this.handleVote}
      >
        <div className="nominee-name">{this.props.nominee.name}</div>
        {this.renderDescription()}
      </a>
    );
  }
});
