import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/verification_bloc.dart';
import 'package:flutter_tutorial/page/get_started.dart';
import 'package:flutter_tutorial/page/registration.dart';
import 'package:flutter_tutorial/page/verification.dart';

import 'bloc/login_bloc.dart';
import 'bloc/registration_bloc.dart';
import 'page/home.dart';
import 'page/login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/get_started',
      routes: {
        '/get_started': (context) => GetStarted(),
        '/login': (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: Login(),
          );
        },
        '/registration': (context) {
          return BlocProvider(
            create: (context) => RegistrationBloc(),
            child: Registration(),
          );
        },
        '/verification': (context) {
          return BlocProvider(
            create: (context) => VerificationBloc(),
            child: Verification(),
          );
        },
        '/home': (context) => Home(),
      },
    ));
