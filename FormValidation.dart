import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  performLogin() {
    final snackbar = SnackBar(
      content: Text("Email : ${_email} , Password : ${_password}"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Form Page"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: InputDecoration(labelText: "Enter Email"),
                  validator: (val) =>
                      !val.contains("@") ? "Invalid Email" : null),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter password"),
                validator: (val) => val.length < 6 ? "Invalid Password" : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              RaisedButton(
                child: Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
