import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_register_firebase/service/database.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Database database = Database();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnClickLogin) {
      yield LoginLoading();
      if (await database.getLoginData(event.username, event.password) == true) {
        yield LoginSuccess();
      } else if (await database.getLoginData(event.username, event.password) ==
          false) {
        yield LoginInitial();
        print('Incorrect username or password!');
      } else {
        yield LoginInitial();
        print('Connection Error');
      }
    }
  }
}
