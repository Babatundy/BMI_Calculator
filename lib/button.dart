import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //final Function selecthandler;
  String answer;
  int i;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Button(this._formKey);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _formKey.currentState.validate();
        final snackbar = SnackBar(
          content: Text("hello 7obi"),
          duration: Duration(milliseconds: 500),
        );

        if (_formKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(snackbar);
        }
      },
      color: Colors.black87,
      child: Text(
        "Enter",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

