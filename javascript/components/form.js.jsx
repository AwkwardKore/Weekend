var Form = React.createClass({

  render: function() {
    return(
      <div>
        <div className="navbar">
          <h1 className="text-center">Weekend</h1>
        </div>
        <div className="row">
          <div className="col-md-offset-3 col-md-6">
            <div className="jumbotron">
              <form className="form-group form-group-material-red">
                <input className="form-control floating-label" ref="message" type="text" placeholder="Write your message..."></input>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
  }

});
