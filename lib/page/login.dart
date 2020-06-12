import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/login_bloc.dart';
import 'package:flutter_tutorial/model/account.dart';
import 'package:flutter_tutorial/page/home.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Account account = Account();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Demo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          return buildLoginInitial(context);
        },
      ),
    );
  }

  Widget buildLoginInitial(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Text("UserName"),
          ),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: "Owen"),
              onChanged: (value) {
                account.loginUsername = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Text("Password"),
          ),
          Container(
            width: 200,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
              onChanged: (value) {
                account.loginPassword = value;
              },
            ),
          ),
          Container(
            height: 47,
            width: 200,
            margin: EdgeInsets.only(
              top: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: FlatButton(
              onPressed: () {
                triggerLoginButton(
                    context, account.loginUsername, account.loginPassword);
              },
              child: Container(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void triggerLoginButton(
    BuildContext context, String username, String password) {
  final loginBloc = BlocProvider.of<LoginBloc>(context);
  loginBloc.add(OnClickLogin(username, password));
}
