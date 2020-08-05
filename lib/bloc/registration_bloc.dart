import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_register_firebase/model/account.dart';
import 'package:flutter_login_register_firebase/service/database.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  Database database = Database();
  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is OnClickRegister) {
      yield RegistrationLoading();
      if (await database.checkExistingUsername(event.username) == true) {
        yield RegistrationInitial();
        print('Username already exist');
      } else if (await database.checkExistingUsername(event.username) ==
          false) {
        yield RegistrationLoading();
        if (await database.checkExistingPhoneNumber(event.phoneNumber) ==
            true) {
          yield RegistrationInitial();
          print('Phone number already exist');
        } else if (await database.checkExistingPhoneNumber(event.phoneNumber) ==
            false) {
          yield RegistrationLoading();
          Account.registrationUsername = event.username;
          Account.registrationPassword = event.password;
          Account.verifyPhoneNumber = event.phoneNumber;
          yield RegistrationSuccess();
        } else {
          yield RegistrationInitial();
          print('Phone number invalid');
        }
      } else {
        yield RegistrationInitial();
        print('Connection Error');
      }
    }
  }
}
