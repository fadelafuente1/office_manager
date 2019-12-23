import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  CustomAlertDialogState createState() {
    return new CustomAlertDialogState();
  }
}

class CustomAlertDialogState extends State<CustomAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Agregar partida"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: new InputDecoration(hintText: "Ganador"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Agregue texto';
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: new InputDecoration(hintText: "Perdedor"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Agregue texto';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Agregar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    _formKey.currentState.save();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}