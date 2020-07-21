import 'package:flutter/material.dart';
import 'package:net_ninja_brew/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function onToggle;

  SignIn({this.onToggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.onToggle();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () async {
                  print('$email \n $password');
                },
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
