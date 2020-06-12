import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'page/home.dart';
import 'page/login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: Login(),
          );
        },
        '/home': (context) => Home(),
      },
    ));
