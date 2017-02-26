var BallotCategory = React.createClass({
  propTypes: {
    name: React.PropTypes.string.isRequired,
    nominees: React.PropTypes.array.isRequired,
    votedNomineeId: React.PropTypes.number
  },

  getInitialState() {
    return {
      nominees: this.props.nominees || [],
      votedNomineeId: this.props.votedNomineeId
    };
  },

  handleVote(nomineeId) {
    this.setState({votedNomineeId: nomineeId});
  },

  renderNominee: function(nominee) {
    return (
      <BallotNominee
        key={nominee.id}
        nominee={nominee}
        isSelected={nominee.id == this.state.votedNomineeId}
        handleVote={this.handleVote}
      />
    )
  },

  render: function() {
    return (
      <div>
        <h1>{this.props.name}</h1>
        {_.map(this.state.nominees, this.renderNominee)}
      </div>
    );
  }
});
