var Form = React.createClass({

  handleSubmit: function(e) {
    e.preventDefault();
    rname = React.findDOMNode(this.refs.rname).value;
    user = React.findDOMNode(this.refs.user).value;
    pwd = React.findDOMNode(this.refs.pwd).value;
    mail = React.findDOMNode(this.refs.mail).value;
    $.ajax({
      url: "http://localhost:3000/users/new",
      contentType: false,
      processData: false,
      datatype: "json",
      data: this.sendMessage(),
      success: function(data) {
        this.setState({data: data});
      }.bind(this)
    });
  },

  sendMessage: function() {
    var obj = function (){
        var form_Data_Message = new FormData();
        form_Data_Message.append('rname', React.findDOMNode(this.refs.rname).value);
        form_Data_Message.append('user', React.findDOMNode(this.refs.user).value);
        form_Data_Message.append('pwd', React.findDOMNode(this.refs.pwd).value);
        form_Data_Message.append('mail', React.findDOMNode(this.refs.mail).value);
        return form_Data_Message;
      }.bind(this)
    return obj();
  },

  render: function() {
    return(
      <div>
        <div className="navbar">
          <h1 className="text-center">Weekend</h1>
        </div>
        <div className="row">
          <div className="col-md-offset-3 col-md-6">
            <div className="jumbotron">
              <form className="commentForm" onSubmit={this.handleSubmit} encType="multipart/form-data">
                <div className="form-group form-group-material-red">
                  <input className="form-control floating-label" ref="rname" type="text" placeholder="Nombre"></input>
                </div>
                <div className="form-group form-group-material-red">
                  <input className="form-control floating-label" ref="user" type="text" placeholder="User"></input>
                </div>
                <div className="form-group form-group-material-red">
                  <input className="form-control floating-label" ref="pwd" type="text" placeholder="Password"></input>
                </div>
                <div className="form-group form-group-material-red">
                  <input className="form-control floating-label" ref="mail" type="text" placeholder="Mail"></input>
                </div>
                <div className="text-center">
                  <input type="submit" value="Post" className="btn btn-success btn-raised"></input>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
  }

});
