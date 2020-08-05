import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_register_firebase/bloc/login_bloc.dart';
import 'package:flutter_login_register_firebase/model/account.dart';
import 'package:flutter_login_register_firebase/page/home.dart';

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
          "Login",
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
          if (state is LoginInitial) {
            return buildLoginInitial(context);
          } else if (state is LoginLoading) {
            return buildLoading(context);
          }
          return buildLoginInitial(context);
        },
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
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
            child: Text("Username"),
          ),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: "Jubel"),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
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
          ),
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
