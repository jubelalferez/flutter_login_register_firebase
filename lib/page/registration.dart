import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/registration_bloc.dart';
import 'package:flutter_tutorial/model/account.dart';

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  Account account = Account();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            Navigator.pushNamed(context, '/verification');
          }
        },
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return buildLoading(context);
          } else if (state is RegistrationInitial) {
            return buildRegistrationInitial(context);
          }
          return buildRegistrationInitial(context);
        },
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildRegistrationInitial(BuildContext context) {
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
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Text("Phone number"),
          ),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: "0932"),
              onChanged: (value) {
                account.registrationPhoneNumber = value;
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
                triggerRegisterButton(context, account.loginUsername,
                    account.loginPassword, account.registrationPhoneNumber);
              },
              child: Container(
                child: Text(
                  "Register",
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

void triggerRegisterButton(BuildContext context, String username,
    String password, String phoneNumber) {
  final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
  registrationBloc.add(OnClickRegister(username, password, phoneNumber));
}
