var BallotCategory = React.createClass({
  propTypes: {
    id: React.PropTypes.number.isRequired,
    name: React.PropTypes.string.isRequired,
    nominees: React.PropTypes.array.isRequired,
    votedNomineeId: React.PropTypes.number,
    winningNomineeId: React.PropTypes.number
  },

  getInitialState() {
    return {
      nominees: this.props.nominees || [],
      votedNomineeId: this.props.votedNomineeId
    };
  },

  handleVote(nomineeId) {
    console.log("Voting")

    superagent.post('/votes')
      .set('Accept', 'application/json')
      .send({
        authenticity_token: document.head.querySelector('meta[name="csrf-token"]').content,
        vote: {
          category_id: this.props.id,
          nominee_id: nomineeId}
        })
      .end(function(err, res){
        console.log("here", err, res)
      });

    this.setState({votedNomineeId: nomineeId});
  },

  renderNominee: function(nominee) {
    console.log(nominee.id, this.state.votedNomineeId);

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
      <div className="category">
        <h1>{this.props.name}</h1>
        {_.map(this.state.nominees, this.renderNominee)}
      </div>
    );
  }
});
